#ifndef MOD_BASE_HPP
#define MOD_BASE_HPP

#include "../data-sys/text_prompts_dao.hpp"
#include "../model-sys/config.hpp"

#include "../session_data.hpp"
#include "../session_io.hpp"
#include "../ansi_processor.hpp"

#include <algorithm>
#include <memory>
#include <iostream>
#include <string>


/**
 * @class ModBase
 * @author Michael Griffin
 * @date 3/17/2016
 * @file mod_base.hpp
 * @brief Base Class for Module System
 */
class ModBase
{
public:

    virtual ~ModBase()
    {
        std::cout << "~ModBase." << std::endl;
    }
    virtual bool update(const std::string &character_buffer, const bool &is_utf8) = 0;
    virtual bool onEnter() = 0;
    virtual bool onExit()  = 0;

    ModBase(session_data_ptr session_data, config_ptr config, ansi_process_ptr ansi_process)
        : m_session_data(session_data)
        , m_config(config)
        , m_session_io(session_data)
        , m_ansi_process(ansi_process)
        , m_is_active(false)
    { }

    /**
     * @brief Transform Strings to Uppercase with Locale
     * @param value
     */
    void baseTransformToUpper(std::string &value)
    {
        auto stringToUpper = std::bind1st(
                            std::mem_fun(
                                &std::ctype<char>::toupper),
                                &std::use_facet<std::ctype<char> >(std::locale()));
            
        transform(value.begin(), value.end(), value.begin(), stringToUpper);    
    }
    
    /**
     * @brief Transform Strings to Lowercase with Locale
     * @param value
     */
    void baseTransformToLower(std::string &value)
    {
        auto stringToLower = std::bind1st(
                            std::mem_fun(
                                &std::ctype<char>::tolower),
                                &std::use_facet<std::ctype<char> >(std::locale()));
            
        transform(value.begin(), value.end(), value.begin(), stringToLower);    
    }

    /**
     * @brief Gets the Default Color Sequence
     * @return 
     */
    std::string baseGetDefaultColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_regular);
    }
    
    /**
     * @brief Gets the Default Input Color Sequence
     * @return 
     */
    std::string baseGetDefaultInputColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_input);
    }
    
    /**
     * @brief Gets the Default Input Color Sequence
     * @return 
     */
    std::string baseGetDefaultInverseColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_inverse);
    }
    
    /**
     * @brief Gets the Default Box Color Sequence
     * @return 
     */
    std::string baseGetDefaultBoxColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_box);
    }
    
    /**
     * @brief Gets the Default Prompt Color Sequence
     * @return 
     */
    std::string baseGetDefaultPromptColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_prompt);
    }

    /**
     * @brief Gets the Default Stat Color Sequence
     * @return 
     */
    std::string baseGetDefaultStatColor() 
    {
        return m_session_io.pipeColors(m_config->default_color_stat);
    }

    /**
     * @brief Method for Adding outgoing text data to ANSI processor
     *        Then delivering the data to the client
     * @param data
     */
    void baseProcessAndDeliver(std::string &data)
    {
        // Clear out attributes on new strings no bleeding of colors.
        std::string output = "\x1b[0m" + baseGetDefaultColor();
        output += std::move(data);
        m_ansi_process->parseAnsiScreen((char *)output.c_str());
        output += baseGetDefaultInputColor();
        m_session_data->deliver(output);
    }
    
    /**
     * @brief Deliver Output followed with New Line.
     * @param data
     */
    void baseProcessAndDeliverNewLine(std::string &data)
    {
        data += "\r\n";
        baseProcessAndDeliver(data);        
    }
    
    /**
     * @brief Deliver NewLine for [ENTER] On Prompts.
     */
    void baseProcessDeliverNewLine()
    {
        std::string data = "\r\n";
        baseProcessAndDeliver(data);
    }
    
    /**
     * @brief Deliver Input for prompts (No Coloring Extras)
     */
    void baseProcessDeliverInput(std::string &data)
    {
        m_ansi_process->parseAnsiScreen((char *)data.c_str());
        m_session_data->deliver(data);
    }
    
    /**
     * @brief Pull and Display Prompts
     * @param prompt
     */
    void baseDisplayPrompt(const std::string &prompt, text_prompts_dao_ptr m_text_dao)
    {
        // Set Default String Color, Can be overridden with pipe colors in text prompt.
        std::string result = baseGetDefaultColor();
        
        // Parse Prompt for Input Color And Position Override.
        // If found, the colors of the MCI Codes should be used as the default color.
        M_StringPair prompt_set = m_text_dao->getPrompt(prompt);
        std::string::size_type idx = prompt_set.second.find("%IN", 0);
        
        result += std::move(m_session_io.parseTextPrompt(prompt_set));
        
        // Not found, set default input color
        if (idx == std::string::npos) 
        {
            result += baseGetDefaultInputColor();        
        }
        else
        {
            // Testing.
            std::cout << " *** Detected %IN in prompt string!" << std::endl;
        }

        //std::cout << "prompt: " << result << std::endl;
        baseProcessAndDeliver(result);    
    }
    
    /**
     * @brief Pull and Return Display Prompt
     * @param prompt
     */
    std::string baseGetDisplayPrompt(const std::string &prompt, text_prompts_dao_ptr m_text_dao)
    {
        // Set Default String Color, Can be overridden with pipe colors in text prompt.
        std::string result = baseGetDefaultColor();
        
        // Parse Prompt for Input Color And Position Override.
        // If found, the colors of the MCI Codes should be used as the default color.
        M_StringPair prompt_set = m_text_dao->getPrompt(prompt);
        std::string::size_type idx = prompt_set.second.find("%IN", 0);
        
        result += std::move(m_session_io.parseTextPrompt(prompt_set));
        
        // Not found, set default input color
        if (idx == std::string::npos) 
        {
            result += baseGetDefaultInputColor();        
        }
        else
        {
            // Testing.
            std::cout << " *** Detected %IN in prompt string!" << std::endl;
        }

        return result;
    }
    
    /**
     * @brief Pull and Return Raw Display Prompts
     * @param prompt
     */
    std::string baseGetDisplayPromptRaw(const std::string &prompt, text_prompts_dao_ptr m_text_dao)
    {       
        // Parse Prompt for Input Color And Position Override.
        // If found, the colors of the MCI Codes should be used as the default color.
        M_StringPair prompt_set = m_text_dao->getPrompt(prompt);
        return prompt_set.second;
    }
    
    /**
     * @brief Pull and Display Prompts, Replace MCI Code |OT
     * @param prompt
     */
    void baseDisplayPromptMCI(const std::string &prompt, text_prompts_dao_ptr m_text_dao, std::string mci_field)
    {
        // Set Default String Color, Can be overridden with pipe colors in text prompt.
        std::string result = baseGetDefaultColor();
        
        // Parse Prompt for Input Color And Position Override.
        // If found, the colors of the MCI Codes should be used as the default color.
        M_StringPair prompt_set = m_text_dao->getPrompt(prompt);
        std::string::size_type idx  = prompt_set.second.find("%IN", 0);
        
        // Parse and replace the MCI Code with the field value
        std::string mci_code = "|OT";       
        m_session_io.m_common_io.parseLocalMCI(prompt_set.second, mci_code, mci_field);        

        // Does pipe2ansi for colors etc..
        result += std::move(m_session_io.parseTextPrompt(prompt_set));
        
        // Not found, set default input color
        if (idx == std::string::npos) 
        {
            result += baseGetDefaultInputColor();        
        }
        else
        {
            // Testing.
            std::cout << " *** Detected %IN in prompt string!" << std::endl;
        }
         
        
        //std::cout << "prompt: " << result << std::endl;
        baseProcessAndDeliver(result);    
    }
    
    /**
     * @brief Pull and Display Prompt with a following new line for info messages.
     * @param prompt
     */
    void baseDisplayPromptAndNewLine(const std::string &prompt, text_prompts_dao_ptr m_text_dao)
    {
        // Set Default String Color, Can be overridden with pipe colors in text prompt.
        std::string result = baseGetDefaultColor();
        
        // Parse Prompt for Input Color And Position Override.
        // If found, the colors of the MCI Codes should be used as the default color.
        M_StringPair prompt_set = m_text_dao->getPrompt(prompt);
        std::string::size_type idx = prompt_set.second.find("%IN", 0);
        
        result += m_session_io.parseTextPrompt(prompt_set);
        
        // Not found, set default input color
        if (idx == std::string::npos) 
        {
            result += baseGetDefaultInputColor();        
        }
        else
        {
            // Testing.
            std::cout << " *** Detected %IN in prompt string!" << std::endl;
        }
        
        // Add New Line.
        result += "\r\n";

        //std::cout << "prompt: " << result << std::endl;
        baseProcessAndDeliver(result);    
    }
    
    /**
     * @brief Move to End of Display then output
     * @param output
     */
    void moveToBottomAndDisplay(const std::string &prompt)
    {
        std::string output = "";
        int screen_row = m_ansi_process->getMaxRowsUsedOnScreen();

        output += baseGetDefaultColor();
        output += "\x1b[" + std::to_string(screen_row) + ";1H\r\n";
        output += std::move(prompt);
        baseProcessAndDeliver(output);
    }

    /**
     * @brief Move to End of Display then Setup Display for String
     * @param output
     */
    std::string moveStringToBottom(const std::string &prompt)
    {
        std::string output = "";
        int screen_row = m_ansi_process->getMaxRowsUsedOnScreen();

        output += baseGetDefaultColor();
        output += "\x1b[" + std::to_string(screen_row) + ";1H\r\n";
        output += std::move(prompt);
        return output;
    }
    
    // This holds session data passed to each session.
    // In modules we'll use the weak pointer so more clarity.
    session_data_ptr  m_session_data;
    config_ptr        m_config;
    SessionIO         m_session_io;
    ansi_process_ptr  m_ansi_process;
    bool              m_is_active;


    // All Data is saved to this buffer, which is then
    // Checked after each stage, onEnter, Update, onExit
};

typedef std::shared_ptr<ModBase>	module_ptr;


#endif // MOD_BASE_HPP
