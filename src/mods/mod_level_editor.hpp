#ifndef MOD_LEVEL_EDITOR_HPP
#define MOD_LEVEL_EDITOR_HPP

#include "mod_base.hpp"

#include <string>
#include <memory>
#include <functional>
#include <vector>

class AccessLevel;
typedef std::shared_ptr<AccessLevel> access_level_ptr;

class SessionData;
typedef std::shared_ptr<SessionData> session_data_ptr;

class Directory;
typedef std::shared_ptr<Directory> directory_ptr;

/**
 * @class ModLevelEditor
 * @author Michael Griffin
 * @date 15/08/2018
 * @file mod_level_editor.hpp
 * @brief Level Editor
 */
class ModLevelEditor
    : public ModBase
{
public:
    ModLevelEditor(session_data_ptr session_data, config_ptr config, ansi_process_ptr ansi_process)
        : ModBase(session_data, config, ansi_process)
        , m_session_io(session_data)
        , m_filename("mod_level_editor.yaml")
        , m_text_prompts_dao(new TextPromptsDao(GLOBAL_DATA_PATH, m_filename))
        , m_mod_setup_index(MOD_DISPLAY_MENU)
        , m_mod_function_index(MOD_MENU_INPUT)
        , m_mod_menu_state_index(MENU_ADD)
        , m_mod_toggle_view_index(VIEW_DEFAULT)
        , m_max_toggled_view_index(VIEW_PULLDOWN)
        , m_is_text_prompt_exist(false)
        , m_page(0)
        , m_rows_per_page(0)
        , m_current_menu("")
        , m_current_option(0)
        , m_current_field(0)
    {
        std::cout << "ModLevelEditor" << std::endl;

        // Setup Modules
        m_setup_functions.push_back(std::bind(&ModLevelEditor::setupMenuEditor, this));
        m_setup_functions.push_back(std::bind(&ModLevelEditor::setupMenuOptionEditor, this));
        m_setup_functions.push_back(std::bind(&ModLevelEditor::setupMenuEditFields, this));
        m_setup_functions.push_back(std::bind(&ModLevelEditor::setupMenuOptionEditFields, this));

        // Input or Method Modules that handle incoming input per state.
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorInput, this, std::placeholders::_1));
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorPausedInput, this, std::placeholders::_1));
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuNameInput, this, std::placeholders::_1));

        // Menu Option Input Commands.
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorOptionInput, this, std::placeholders::_1));
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuOptionInput, this, std::placeholders::_1));

        // Menu Field Input Commands
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuFieldInput, this, std::placeholders::_1));
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuFieldHandler, this, std::placeholders::_1));

        // Menu Option Field Input Commands.
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuOptionFieldInput, this, std::placeholders::_1));
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorMenuOptionFieldHandler, this, std::placeholders::_1));

        // Display Pause, waits for a key, then returns (Used in View Generic Menu)
        m_mod_functions.push_back(std::bind(&ModLevelEditor::menuEditorDisplayPause, this, std::placeholders::_1));



        // Check of the Text Prompts exist.
        m_is_text_prompt_exist = m_text_prompts_dao->fileExists();
        if (!m_is_text_prompt_exist)
        {
            createTextPrompts();
        }

        // Loads all Text Prompts for current module
        m_text_prompts_dao->readPrompts();
    }

    virtual ~ModLevelEditor() override
    {
        std::cout << "~ModLevelEditor" << std::endl;
        std::vector<std::function< void()> >().swap(m_setup_functions);
        std::vector<std::function< void(const std::string &)> >().swap(m_mod_functions);
        std::vector<access_level_ptr>().swap(m_loaded_level);
    }

    virtual bool update(const std::string &character_buffer, const bool &) override;
    virtual bool onEnter() override;
    virtual bool onExit() override;

    // Setup Module Index
    enum
    {
        MOD_DISPLAY_MENU              = 0,
        MOD_DISPLAY_MENU_OPTIONS      = 1,
        MOD_DISPLAY_MENU_EDIT         = 2,
        MOD_DISPLAY_MENU_OPTIONS_EDIT = 3
    };

    // Input Module Index
    enum
    {
        MOD_MENU_INPUT              = 0, // Menu Parser
        MOD_PAUSE                   = 1, // Pauses on display of menus/options
        MOD_MENU_NAME               = 2, // Menu Name Handler
        MOD_MENU_OPTION_INPUT       = 3, // Menu Option Parser
        MOD_MENU_OPTION             = 4, // Option Index Handler
        MOD_MENU_FIELD_INPUT        = 5, // Menu Field Parser
        MOD_MENU_FIELD              = 6, // Menu Field Handler
        MOD_MENU_OPTION_FIELD_INPUT = 7, // Menu Option Field Parser
        MOD_MENU_OPTION_FIELD       = 8, // Menu Option Field Handler
        MOD_DISPLAY_PAUSE           = 9  // Display Pause for View Generic Menu
    };

    // Input Menu State Index
    // Used for both Menus and Options.
    enum
    {
        MENU_ADD       = 0,
        MENU_CHANGE    = 1,
        MENU_DELETE    = 2,
        MENU_COPY_FROM = 3,
        MENU_COPY_TO   = 4,
        MENU_MOVE_FROM = 5,
        MENU_MOVE_TO   = 6
    };

    // Menu Option Toggled View State
    // Lets so switch the views to see other command information.
    enum
    {
        VIEW_DEFAULT  = 0,
        VIEW_NAMES    = 1,
        VIEW_STRINGS  = 2,
        VIEW_PULLDOWN = 3
    };

    // Box drawing characters
    enum
    {
        BORDER_TOP_LEFT  = (char)214,  // ╓
        BORDER_BOT_LEFT  = (char)211,  // ╙
        BORDER_ROW       = (char)196,  // ─
        BORDER_TOP_RIGHT = (char)183,  // ╖
        BORDER_BOT_RIGHT = (char)189,  // ╜
        BORDER_MID_TOP   = (char)210,  // ╥
        BORDER_MID_BOT   = (char)208,  // ╨
        BORDER_MID       = (char)186   // ║
    };

    // Create Prompt Constants, these are the keys for key/value lookup
    const std::string PROMPT_HEADER = "level_header";
    const std::string PROMPT_OPTION_HEADER = "level_option_header";
    const std::string PROMPT_LEVEL_EDIT_HEADER = "level_field_edit_header";
    const std::string PROMPT_PAUSE = "pause_prompt";
    const std::string PROMPT_INPUT_TEXT = "level_input_text";
    const std::string PROMPT_OPTION_INPUT_TEXT = "option_input_text";
    const std::string PROMPT_INVALID = "invalid_input";

    const std::string PROMPT_LEVEL_ADD = "level_add";
    const std::string PROMPT_LEVEL_DELETE = "level_delete";
    const std::string PROMPT_LEVEL_CHANGE = "level_edit";
    const std::string PROMPT_INVALID_LEVEL_EXISTS = "invalid_level_exists";
    const std::string PROMPT_INVALID_LEVEL_NOT_EXISTS = "invalid_level_doesnt_exist";

    // Menu Field Edit Prompts
    const std::string PROMPT_MENU_FIELD_INPUT_TEXT = "menu_field_input_text";
    const std::string PROMPT_MENU_FIELD_TITLE = "menu_field_title";
    const std::string PROMPT_MENU_FIELD_PASSWORD = "menu_field_password";
    const std::string PROMPT_MENU_FIELD_FALLBACK = "menu_field_fallback";
    const std::string PROMPT_MENU_FIELD_HELP_ID  = "menu_field_help_id";
    const std::string PROMPT_MENU_FIELD_NAME = "menu_field_name";
    const std::string PROMPT_MENU_FIELD_PULLDOWN = "menu_field_pulldown";

    // Menu Options
    const std::string PROMPT_INVALID_OPTION_NOT_EXISTS = "invalid_option_doesnt_exist";
    const std::string PROMPT_MENU_OPTION_ADD = "option_add";
    const std::string PROMPT_MENU_OPTION_DELETE = "option_delete";
    const std::string PROMPT_MENU_OPTION_CHANGE = "option_change";
    const std::string PROMPT_MENU_OPTION_COPY_FROM = "option_copy_from";
    const std::string PROMPT_MENU_OPTION_COPY_TO = "option_copy_to";
    const std::string PROMPT_MENU_OPTION_MOVE_FROM = "option_move_from";
    const std::string PROMPT_MENU_OPTION_MOVE_TO = "option_move_to";

    // Menu Option Field Edit Prompts
    const std::string PROMPT_MENU_OPTION_EDIT_HEADER = "option_field_edit_header";
    const std::string PROMPT_MENU_OPTION_FIELD_INPUT_TEXT = "option_field_input_text";
    const std::string PROMPT_MENU_OPTION_FIELD_NAME = "option_field_name";
    const std::string PROMPT_MENU_OPTION_FIELD_ACS = "option_field_acs";
    const std::string PROMPT_MENU_OPTION_FIELD_HIDDEN = "option_field_hidden";
    const std::string PROMPT_MENU_OPTION_FIELD_CMD_KEY = "option_field_cmd_key";
    const std::string PROMPT_MENU_OPTION_FIELD_MENU_KEY = "option_field_menu_key";
    const std::string PROMPT_MENU_OPTION_FIELD_CMD_STRING = "option_field_cmd_string";
    const std::string PROMPT_MENU_OPTION_FIELD_PULLDOWN = "option_field_pulldown_id";

    // Dsiplay Page for Option Fields.
    const std::string PROMPT_OPTION_TOGGLE = "option_toggle_view_display";
    
    // Menu Field Display for screen
    const std::string DISPLAY_MENU_FIELDS_VERSION_ID = "display_menu_field_version_id";
    const std::string DISPLAY_MENU_FIELDS_BORDER_ROW_COLOR = "display_menu_field_row_color";
    const std::string DISPLAY_MENU_FIELDS_TITLE = "display_menu_field_title";
    const std::string DISPLAY_MENU_FIELDS_PASSWORD = "display_menu_field_passoword";
    const std::string DISPLAY_MENU_FIELDS_FALLBACK = "display_menu_field_fallback";
    const std::string DISPLAY_MENU_FIELDS_HELP_ID = "display_menu_field_help_id";
    const std::string DISPLAY_MENU_FIELDS_NAME = "display_menu_field_name";
    const std::string DISPLAY_MENU_FIELDS_PULLDOWN_FILE = "display_menu_field_pulldown_file";
    const std::string DISPLAY_MENU_FIELDS_VIEW_GENERIC = "display_menu_field_view_generic";
    const std::string DISPLAY_MENU_FIELDS_EDIT_OPTIONS = "display_menu_field_edit_options";
    const std::string DISPLAY_MENU_FIELDS_QUIT_SAVE = "display_menu_field_save";
    const std::string DISPLAY_MENU_FIELDS_QUIT_ABORT = "display_menu_field_abort";
    
    // Option Field Diplay For screen 
    const std::string DISPLAY_OPT_FIELDS_OPTION_ID = "display_option_field_option_id";
    const std::string DISPLAY_OPT_FIELDS_BORDER_ROW_COLOR = "display_option_field_row_color";
    const std::string DISPLAY_OPT_FIELDS_OPTION_NAME = "display_option_field_option_name";
    const std::string DISPLAY_OPT_FIELDS_OPTION_ACS = "display_option_field_option_acs";
    const std::string DISPLAY_OPT_FIELDS_OPTION_HIDDEN = "display_option_field_option_hidden";
    const std::string DISPLAY_OPT_FIELDS_OPTION_CMD_KEYS = "display_option_field_option_cmd_keys";
    const std::string DISPLAY_OPT_FIELDS_OPTION_MENU_KEY = "display_option_field_option_menu_key";
    const std::string DISPLAY_OPT_FIELDS_OPTION_CMD_STRING = "display_option_field_option_cmd_string";
    const std::string DISPLAY_OPT_FIELDS_OPTION_PULLDOWN_ID = "display_option_field_option_pulldown_id";
    const std::string DISPLAY_OPT_FIELDS_OPTION_PREVIOUS_OPT = "display_option_field_option_previous_opt";
    const std::string DISPLAY_OPT_FIELDS_OPTION_NEXT_OPT = "display_option_field_option_next_opt";
    const std::string DISPLAY_OPT_FIELDS_OPTION_QUIT = "display_option_field_option_next_quit";

    /**
     * @brief Create Default Text Prompts for module
     * @return
     */
    void createTextPrompts();

    /**
     * @brief Sets an individual input module index.
     * @param mod_function_index
     */
    void changeInputModule(int mod_function_index);

    /**
     * @brief Sets an individual setup method module index.
     * @param mod_function_index
     */
    void changeSetupModule(int mod_function_index);

    /**
     * @brief Sets an individual Menu Input State Add/Change/Delete
     * @param mod_menu_state_index
     */
    void changeMenuInputState(int mod_menu_state_index);

    /**
     * @brief Redisplay's the current module prompt.
     * @return
     */
    void redisplayModulePrompt();

    /**
     * @brief Toggle the Option View.
     * @return
     */
    void toggleNextOptionView();

    /**
     * @brief Pull and Display Prompts
     * @param prompt
     */
    void displayPrompt(const std::string &prompt);

    /**
     * @brief Pull and parse and return Display Prompts for use in interfaces
     * @param prompt
     */
    std::string getDisplayPrompt(const std::string &prompt);

    /**
     * @brief Pull and parse and return Display Prompts for use in interfaces
     * @param prompt
     */
    std::string getDisplayPromptRaw(const std::string &prompt);

    /**
     * @brief Pull and Display Prompts with MCI Code
     * @param prompt
     * @param mci_field
     */
    void displayPromptMCI(const std::string &prompt, const std::string &mci_field);

    /**
     * @brief Pull and Display Prompts with following newline
     * @param prompt
     */
    void displayPromptAndNewLine(const std::string &prompt);

    /**
     * @brief Validates user Logon
     * @return
     */
    void setupMenuEditor();

    /**
     * @brief Setup for the Menu Options
     * @return
     */
    void setupMenuOptionEditor();

    /**
     * @brief Setup for the Menu Editor
     * @return
     */
    void setupMenuEditFields();

    /**
     * @brief Setup for the Menu Option Editor
     * @return
     */
    void setupMenuOptionEditFields();

    /**
     * @brief Displays the current page of menu items
     * @param input_state
     */
    void displayCurrentPage(const std::string &input_state);

    /**
     * @brief Displays the current page of menu items
     * @param input_state
     */
    void displayCurrentEditPage(const std::string &input_state);

    /**
     * @brief Check if the menu exists in the current listing
     * @param menu_name
     * @return
     */
    bool checkMenuExists(std::string menu_name);

    /**
     * @brief Check if the menu option exists in the current listing
     * @param menu_option
     */
    bool checkMenuOptionExists(unsigned int option_index);

    /**
     * @brief Menu Editor Display, Runs through all existing menus
     * @return
     */
    std::string displayMenuList();

    /**
     * @brief Menu Editor, Read and Modify Menus Options
     * @return
     */
    std::string displayMenuOptionList();

    /**
     * @brief Menu Editor, for Displaying Menu Fields to Edit
     * @return
     */
    std::string displayMenuEditScreen();

    /**
     * @brief Menu Editor, for Displaying Menu Option Fields to Edit
     * @return
     */
    std::string displayMenuOptionEditScreen();

    /**
     * Input Methods below here.
     */

    /**
     * @brief Handles Input (Waiting for Any Key Press)
     * @param input
     */
    void menuEditorPausedInput(const std::string &input);

    /**
     * @brief Handles Input (Waiting for Any Key Press) View Generic Menu
     * @param input
     */
    void menuEditorDisplayPause(const std::string &input);

    /**
     * @brief Handles Menu Editor Command Selection
     * @param input
     */
    void menuEditorInput(const std::string &input);

    /**
     * @brief Handles Menu Option Editor Command Selection
     * @param input
     */
    void menuEditorOptionInput(const std::string &input);

    /**
     * @brief Handles Menu Field Editor Command Selection
     * @param input
     */
    void menuEditorMenuFieldInput(const std::string &input);

    /**
     * @brief Handles Menu Option Field Editor Command Selection
     * @param input
     */
    void menuEditorMenuOptionFieldInput(const std::string &input);

    /**
     * @brief Handles Field Updates for Menu Data
     * @param input
     */
    void menuEditorMenuFieldHandler(const std::string &input);

    /**
     * @brief Handles Menu Option Field Updates
     * @param input
     */
    void menuEditorMenuOptionFieldHandler(const std::string &input);

    /**
     * @brief Handles Menu Name Input, Parses Strings and checks Valid Menus
     * @param input
     */
    void menuEditorMenuNameInput(const std::string &input);

    /**
     * @brief Handles Menu Option Input checking Option Index is Valid
     * @param input
     */
    void menuEditorMenuOptionInput(const std::string &input);

    /**
     * @brief handle each menu separate state and what to do next on input.
     * @param does_menu_exist
     * @param menu_name
     */
    void handleMenuInputState(bool does_menu_exist, const std::string &menu_name);

    /**
     * @brief handle each separate state and what to do next on input.
     * @param does_option_exist
     * @param option_index
     */
    void handleMenuOptionInputState(bool does_option_exist, int option_index);

    /**
     * @brief Create a new empty Menu
     * @param menu_name
     */
    void createNewMenu(const std::string &menu_name);

    /**
     * @brief Create a new empty Menu
     * @param option_index
     */
    void createNewMenuOption(unsigned int option_index);

    /**
     * @brief Delete an existing Menu Option
     * @param option_index
     */
    void deleteExistingMenuOption(unsigned int option_index);

    /**
     * @brief On Insertion of Menu Options, reorder all after index
     * @param option_index
     */
    void reorderMenuIndexesInsertion(unsigned int option_index);

    /**
     * @brief On Deletion of Menu Options, reorder all after index
     * @param option_index
     */
    void reorderMenuIndexesDeletion(unsigned int option_index);

    /**
     * @brief Delete an existing Menu
     * @param menu_name
     */
    void deleteExistingMenu(const std::string &menu_name);

    /**
     * @brief Create a new empty Menu
     * @param menu_name
     */
    void copyExistingMenu(const std::string &menu_name);

    /**
     * @brief Copy an Existing Menu Option
     * @param option_index
     */
    void copyExistingMenuOption(int option_index);

    /**
     * @brief Save Menu Changes
     * @return
     */
    void saveMenuChanges();

    /**
     * @brief Displays a generic Menu of the current Menu and Options
     * @return
     */
    void displayGenericMenu();

private:

    // Function Input Vector.
    std::vector<std::function< void()> >                    m_setup_functions;
    std::vector<std::function< void(const std::string &)> > m_mod_functions;
    std::vector<std::string>                                m_menu_display_list;
    std::vector<access_level_ptr>                           m_loaded_level;

    SessionIO              m_session_io;
    std::string            m_filename;
    text_prompts_dao_ptr   m_text_prompts_dao;

    unsigned int           m_mod_setup_index;
    unsigned int           m_mod_function_index;
    unsigned int           m_mod_menu_state_index;
    unsigned int           m_mod_toggle_view_index;
    unsigned int           m_max_toggled_view_index;

    bool                   m_is_text_prompt_exist;
    unsigned int           m_page;
    unsigned int           m_rows_per_page;
    std::string            m_current_menu;
    unsigned int           m_current_option;
    unsigned int           m_current_field;

    CommonIO               m_common_io;
    directory_ptr          m_directory;

};

#endif // MOD_LEVEL_EDITOR_HPP