#ifndef MENU_SYSTEM_HPP
#define MENU_SYSTEM_HPP

#include "state_base.hpp"
#include "menu_base.hpp"

#include "model-sys/struct_compat.hpp"
#include "model-sys/menu.hpp"

#include <memory>
#include <stdint.h>
#include <string>
#include <vector>
#include <map>
#include <functional>


class Config;
typedef std::shared_ptr<Config> config_ptr;

class ModBase;
typedef std::shared_ptr<ModBase> module_ptr;

class FormManager;
typedef std::shared_ptr<FormManager> form_manager_ptr;


/**
 * @class MenuSystem
 * @author Michael Griffin
 * @date 10/11/2016
 * @file menu_system.hpp
 * @brief Main Menu System State Handles Core Loop
 */
class MenuSystem
    : public StateBase
    , public MenuBase
{
public:
    explicit MenuSystem(session_data_ptr session_data);
    ~MenuSystem();

    virtual void update(const std::string &character_buffer, const bool &is_utf8) override;
    virtual bool onEnter() override;
    virtual bool onExit() override;

    virtual std::string getStateID() const override
    {
        return m_menuID;
    }
    
    //int m_next_state;
    static const std::string m_menuID;
    std::vector<std::string> m_system_fallback;
    
    // handle to form interface.
    form_manager_ptr         m_form_manager;

    
    // Dynamic Map of all Menu Option Command functions
    typedef std::function< bool(const MenuOption & option)> CommandFuncType;    
    typedef std::map<char, CommandFuncType> MappedCommandFunctions;
    
    // Holds map of Menu Option Commands for quick lookup and execution
    MappedCommandFunctions   m_menu_command_functions;
            
    /**
     * @brief Control Commands
     * @param option
     */
    bool menuOptionsControlCommands(const MenuOption &option);

    /**
     * @brief MultiNode Commands
     * @param option
     */
    bool menuOptionsMultiNodeCommands(const MenuOption &option);

    /**
     * @brief Matrix Commands
     * @param option
     */
    bool menuOptionsMatrixCommands(const MenuOption &option);

    /**
     * @brief Global New Scan Commands
     * @param option
     */
    bool menuOptionsGlobalNewScanCommands(const MenuOption &option);

    /**
     * @brief Main Menu Commands
     * @param option
     */
    bool menuOptionsMainMenuCommands(const MenuOption &option);

    /**
     * @brief Door Commands
     * @param option
     */
    bool menuOptionsDoorCommands(const MenuOption &option);
    
    /**
     * @brief Sysop Commands
     * @param option
     */
    bool menuOptionsSysopCommands(const MenuOption &option);
    
    /**
     * @brief New User Voting Commands
     * @param option
     */
    bool menuOptionsNewUserVotingCommands(const MenuOption &option);

    /**
     * @brief Conference Editor Commands
     * @param option
     */
    bool menuOptionsConferenceEditorCommands(const MenuOption &option);
    
    /**
     * @brief Data Area Commands
     * @param option
     */
    bool menuOptionsDataAreaCommands(const MenuOption &option);

    /**
     * @brief Email Commands
     * @param option
     */
    bool menuOptionsEmailCommands(const MenuOption &option);

    /**
     * @brief File Commands
     * @param option
     */
    bool menuOptionsFileCommands(const MenuOption &option);

    /**
     * @brief Message Commands
     * @param option
     */
    bool menuOptionsMessageCommands(const MenuOption &option);

    /**
     * @brief Join Conference Commands
     * @param option
     */
    bool menuOptionsJoinConference(const MenuOption &option);
    
    /**
     * @brief QWK Mail Commands
     * @param option
     */
    bool menuOptionsQWKMailCommands(const MenuOption &option);

    /**
     * @brief Top 10 Listing Commands
     * @param option
     */
    bool menuOptionsTopTenListingCommands(const MenuOption &option);
    
    /**
     * @brief Message Base Sponsor Commands
     * @param option
     */
    bool menuOptionsMessageBaseSponsorCommands(const MenuOption &option);
    
    /**
     * @brief File Base Sponsor Commands
     * @param option
     */
    bool menuOptionsFileBaseSponsorCommands(const MenuOption &option);
    
    /**
     * @brief Voting Commands
     * @param option
     */
    bool menuOptionsVotingCommands(const MenuOption &option);
    
    /**
     * @brief Color Setting Commands
     * @param option
     */
    bool menuOptionsColorSettingCommands(const MenuOption &option);    

    /**
     * @brief Process Command Keys passed from menu selection (Callback)
     * @param option
     */
    bool menuOptionsCallback(const MenuOption &option);

    /**
     * @brief Resets the Menu Input Method in the Function Array
     * @param index
     */
    void resetMenuInputIndex(int index);

    /**
     * @brief Startup External (Door / Script Process)
     * @param cmdline
     */
    void startupExternalProcess(const std::string &cmdline);

    // Each system will have it's own module that is allocated and pushed to the
    // m_module container to easily push and pop from the stack.

    /**
     * @brief Clears All Modules
     */
    void clearAllModules();
    
    /**
     * @brief Exists and Shutsdown the current module
     */
    void shutdownModule();
    
    /**
     * @brief Exists and Shutsdown the current module
     */
    void startupModule(module_ptr module);

    /**
     * @brief Starts up Logon Module
     */
    void startupModulePreLogon();

    /**
     * @brief Starts up Logon Module
     */
    void startupModuleLogon();

    /**
     * @brief Starts up Signup Module
     */
    void startupModuleSignup();
    
    /**
     * @brief Starts up Menu Editor
     */
    void startupModuleMenuEditor();

    /**
     * @brief Startup the User Editor Module
     */
    void startupModuleUserEditor();

    /**
     * @brief Handles Input for Login and PreLogin Sequences.
     * @param character_buffer
     * @param is_utf8
     */
    void handleLoginInputSystem(const std::string &character_buffer, const bool &is_utf8);

    /**
     * @brief Handles parsing input for PreLogon current module.
     */
    void modulePreLogonInput(const std::string &character_buffer, const bool &is_utf8);

    /**
     * @brief Handles parsing input for Logon current module.
     */
    void moduleLogonInput(const std::string &character_buffer, const bool &is_utf8);
    
    /**
     * @brief Handles parsing input for current module.
     */
    void moduleInput(const std::string &character_buffer, const bool &is_utf8);
    
};

#endif // MENU_SYSTEM_HPP
