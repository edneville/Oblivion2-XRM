##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=xrm-unittest
ConfigurationName      :=Debug
WorkspacePath          :=/Users/admin/code/Oblivion2-XRM/osx
ProjectPath            :=/Users/admin/code/Oblivion2-XRM/xrm-unittest
IntermediateDirectory  :=Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Admin
Date                   :=24/06/2018
CodeLitePath           :="/Users/admin/Library/Application Support/codelite"
LinkerName             :=clang++
SharedObjectLinkerName :=clang++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=
PreprocessSuffix       :=.o.i
DebugSwitch            :=-gstab
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)TARGET_OS_MAC $(PreprocessorSwitch)WITHOUT_SDL 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="xrm-unittest.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)../src $(IncludeSwitch)../sqlitewrap $(IncludeSwitch)/usr/local/opt/sqlite/include $(IncludeSwitch)/usr/local/Cellar/yaml-cpp/0.6.1/include $(IncludeSwitch)/usr/local/Cellar/openssl/1.0.2n/include $(IncludeSwitch)/usr/local/Cellar/unittest-cpp/2.0.0/include/UnitTest++ $(IncludeSwitch)/usr/local/Cellar/libssh/0.7.5/include $(IncludeSwitch)/usr/local/Cellar/ossp-uuid/1.6.2_2/include $(IncludeSwitch)../src/sdl2_net $(IncludeSwitch)../src/utf-cpp 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)c++ $(LibrarySwitch)c++abi $(LibrarySwitch)m $(LibrarySwitch)c $(LibrarySwitch)UnitTest++ $(LibrarySwitch)SqliteWrapped $(LibrarySwitch)sqlite3 $(LibrarySwitch)pthread $(LibrarySwitch)ssl $(LibrarySwitch)crypto $(LibrarySwitch)yaml-cpp $(LibrarySwitch)ssh $(LibrarySwitch)uuid 
ArLibs                 :=  "c++" "c++abi" "m" "c" "libUnitTest++.a" "libSqliteWrapped.a" "sqlite3" "pthread" "ssl" "crypto" "yaml-cpp" "libssh" "uuid" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch). $(LibraryPathSwitch)../src $(LibraryPathSwitch)../sqlitewrap $(LibraryPathSwitch)/usr/local/opt/sqlite/lib $(LibraryPathSwitch)/usr/local/opt/icu4c/lib $(LibraryPathSwitch)/usr/local/Cellar/yaml-cpp/0.6.1/lib $(LibraryPathSwitch)/usr/local/Cellar/openssl/1.0.2n/lib $(LibraryPathSwitch)/usr/local/Cellar/unittest-cpp/2.0.0/lib $(LibraryPathSwitch)/usr/local/Cellar/libssh/0.7.5/lib $(LibraryPathSwitch)/usr/local/Cellar/ossp-uuid/1.6.2_2/lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := ar rcus
CXX      := clang++
CC       := clang
CXXFLAGS :=  -O0 -pedantic -std=c++11 -Wall  $(Preprocessors)
CFLAGS   :=  -O3 -pedantic -std=c++11 -Wall  $(Preprocessors)
ASFLAGS  := 
AS       := llvm-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/common_io_ut.cpp$(ObjectSuffix) $(IntermediateDirectory)/session_io_ut.cpp$(ObjectSuffix) $(IntermediateDirectory)/ansi_processor_ut.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_ansi_processor.cpp$(ObjectSuffix) $(IntermediateDirectory)/users_dao_ut.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_session_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_common_io.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_session_io.cpp$(ObjectSuffix) $(IntermediateDirectory)/access_condition_ut.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_src_access_condition.cpp$(ObjectSuffix) $(IntermediateDirectory)/form_system_config_ut.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_form_manager.cpp$(ObjectSuffix) $(IntermediateDirectory)/conference_dao_it.cpp$(ObjectSuffix) $(IntermediateDirectory)/file_area_dao_it.cpp$(ObjectSuffix) $(IntermediateDirectory)/message_area_dao_it.cpp$(ObjectSuffix) $(IntermediateDirectory)/oneliners_dao_it.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_io_service.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_socket_handler.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_socket_ssh.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_src_socket_telnet.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_communicator.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_config_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_conference_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_menu_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_file_area_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_message_area_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_access_level_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_protocol_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_security_dao.cpp$(ObjectSuffix) \
	$(IntermediateDirectory)/up_src_data-sys_session_stats_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_users_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-sys_text_prompts_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_forms_form_system_config.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_data-app_oneliners_dao.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_sdl2_net_SDLnet.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetselect.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetTCP.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetUDP.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d Debug || $(MakeDirCommand) Debug


$(IntermediateDirectory)/.d:
	@test -d Debug || $(MakeDirCommand) Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) main.cpp

$(IntermediateDirectory)/common_io_ut.cpp$(ObjectSuffix): common_io_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/common_io_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/common_io_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/common_io_ut.cpp$(PreprocessSuffix): common_io_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/common_io_ut.cpp$(PreprocessSuffix) common_io_ut.cpp

$(IntermediateDirectory)/session_io_ut.cpp$(ObjectSuffix): session_io_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/session_io_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/session_io_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/session_io_ut.cpp$(PreprocessSuffix): session_io_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/session_io_ut.cpp$(PreprocessSuffix) session_io_ut.cpp

$(IntermediateDirectory)/ansi_processor_ut.cpp$(ObjectSuffix): ansi_processor_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/ansi_processor_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ansi_processor_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ansi_processor_ut.cpp$(PreprocessSuffix): ansi_processor_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ansi_processor_ut.cpp$(PreprocessSuffix) ansi_processor_ut.cpp

$(IntermediateDirectory)/up_src_ansi_processor.cpp$(ObjectSuffix): ../src/ansi_processor.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/ansi_processor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_ansi_processor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_ansi_processor.cpp$(PreprocessSuffix): ../src/ansi_processor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_ansi_processor.cpp$(PreprocessSuffix) ../src/ansi_processor.cpp

$(IntermediateDirectory)/users_dao_ut.cpp$(ObjectSuffix): users_dao_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/users_dao_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/users_dao_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/users_dao_ut.cpp$(PreprocessSuffix): users_dao_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/users_dao_ut.cpp$(PreprocessSuffix) users_dao_ut.cpp

$(IntermediateDirectory)/up_src_session_manager.cpp$(ObjectSuffix): ../src/session_manager.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/session_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_session_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_session_manager.cpp$(PreprocessSuffix): ../src/session_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_session_manager.cpp$(PreprocessSuffix) ../src/session_manager.cpp

$(IntermediateDirectory)/up_src_common_io.cpp$(ObjectSuffix): ../src/common_io.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/common_io.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_common_io.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_common_io.cpp$(PreprocessSuffix): ../src/common_io.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_common_io.cpp$(PreprocessSuffix) ../src/common_io.cpp

$(IntermediateDirectory)/up_src_session_io.cpp$(ObjectSuffix): ../src/session_io.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/session_io.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_session_io.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_session_io.cpp$(PreprocessSuffix): ../src/session_io.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_session_io.cpp$(PreprocessSuffix) ../src/session_io.cpp

$(IntermediateDirectory)/access_condition_ut.cpp$(ObjectSuffix): access_condition_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/access_condition_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/access_condition_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/access_condition_ut.cpp$(PreprocessSuffix): access_condition_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/access_condition_ut.cpp$(PreprocessSuffix) access_condition_ut.cpp

$(IntermediateDirectory)/up_src_access_condition.cpp$(ObjectSuffix): ../src/access_condition.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/access_condition.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_access_condition.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_access_condition.cpp$(PreprocessSuffix): ../src/access_condition.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_access_condition.cpp$(PreprocessSuffix) ../src/access_condition.cpp

$(IntermediateDirectory)/form_system_config_ut.cpp$(ObjectSuffix): form_system_config_ut.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/form_system_config_ut.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/form_system_config_ut.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/form_system_config_ut.cpp$(PreprocessSuffix): form_system_config_ut.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/form_system_config_ut.cpp$(PreprocessSuffix) form_system_config_ut.cpp

$(IntermediateDirectory)/up_src_form_manager.cpp$(ObjectSuffix): ../src/form_manager.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/form_manager.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_form_manager.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_form_manager.cpp$(PreprocessSuffix): ../src/form_manager.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_form_manager.cpp$(PreprocessSuffix) ../src/form_manager.cpp

$(IntermediateDirectory)/conference_dao_it.cpp$(ObjectSuffix): conference_dao_it.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/conference_dao_it.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/conference_dao_it.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/conference_dao_it.cpp$(PreprocessSuffix): conference_dao_it.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/conference_dao_it.cpp$(PreprocessSuffix) conference_dao_it.cpp

$(IntermediateDirectory)/file_area_dao_it.cpp$(ObjectSuffix): file_area_dao_it.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/file_area_dao_it.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/file_area_dao_it.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/file_area_dao_it.cpp$(PreprocessSuffix): file_area_dao_it.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/file_area_dao_it.cpp$(PreprocessSuffix) file_area_dao_it.cpp

$(IntermediateDirectory)/message_area_dao_it.cpp$(ObjectSuffix): message_area_dao_it.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/message_area_dao_it.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/message_area_dao_it.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/message_area_dao_it.cpp$(PreprocessSuffix): message_area_dao_it.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/message_area_dao_it.cpp$(PreprocessSuffix) message_area_dao_it.cpp

$(IntermediateDirectory)/oneliners_dao_it.cpp$(ObjectSuffix): oneliners_dao_it.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/xrm-unittest/oneliners_dao_it.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/oneliners_dao_it.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/oneliners_dao_it.cpp$(PreprocessSuffix): oneliners_dao_it.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/oneliners_dao_it.cpp$(PreprocessSuffix) oneliners_dao_it.cpp

$(IntermediateDirectory)/up_src_io_service.cpp$(ObjectSuffix): ../src/io_service.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/io_service.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_io_service.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_io_service.cpp$(PreprocessSuffix): ../src/io_service.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_io_service.cpp$(PreprocessSuffix) ../src/io_service.cpp

$(IntermediateDirectory)/up_src_socket_handler.cpp$(ObjectSuffix): ../src/socket_handler.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/socket_handler.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_socket_handler.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_socket_handler.cpp$(PreprocessSuffix): ../src/socket_handler.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_socket_handler.cpp$(PreprocessSuffix) ../src/socket_handler.cpp

$(IntermediateDirectory)/up_src_socket_ssh.cpp$(ObjectSuffix): ../src/socket_ssh.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/socket_ssh.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_socket_ssh.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_socket_ssh.cpp$(PreprocessSuffix): ../src/socket_ssh.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_socket_ssh.cpp$(PreprocessSuffix) ../src/socket_ssh.cpp

$(IntermediateDirectory)/up_src_socket_telnet.cpp$(ObjectSuffix): ../src/socket_telnet.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/socket_telnet.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_socket_telnet.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_socket_telnet.cpp$(PreprocessSuffix): ../src/socket_telnet.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_socket_telnet.cpp$(PreprocessSuffix) ../src/socket_telnet.cpp

$(IntermediateDirectory)/up_src_communicator.cpp$(ObjectSuffix): ../src/communicator.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/communicator.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_communicator.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_communicator.cpp$(PreprocessSuffix): ../src/communicator.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_communicator.cpp$(PreprocessSuffix) ../src/communicator.cpp

$(IntermediateDirectory)/up_src_data-sys_config_dao.cpp$(ObjectSuffix): ../src/data-sys/config_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/config_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_config_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_config_dao.cpp$(PreprocessSuffix): ../src/data-sys/config_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_config_dao.cpp$(PreprocessSuffix) ../src/data-sys/config_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_conference_dao.cpp$(ObjectSuffix): ../src/data-sys/conference_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/conference_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_conference_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_conference_dao.cpp$(PreprocessSuffix): ../src/data-sys/conference_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_conference_dao.cpp$(PreprocessSuffix) ../src/data-sys/conference_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_menu_dao.cpp$(ObjectSuffix): ../src/data-sys/menu_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/menu_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_menu_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_menu_dao.cpp$(PreprocessSuffix): ../src/data-sys/menu_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_menu_dao.cpp$(PreprocessSuffix) ../src/data-sys/menu_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_file_area_dao.cpp$(ObjectSuffix): ../src/data-sys/file_area_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/file_area_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_file_area_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_file_area_dao.cpp$(PreprocessSuffix): ../src/data-sys/file_area_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_file_area_dao.cpp$(PreprocessSuffix) ../src/data-sys/file_area_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_message_area_dao.cpp$(ObjectSuffix): ../src/data-sys/message_area_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/message_area_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_message_area_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_message_area_dao.cpp$(PreprocessSuffix): ../src/data-sys/message_area_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_message_area_dao.cpp$(PreprocessSuffix) ../src/data-sys/message_area_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_access_level_dao.cpp$(ObjectSuffix): ../src/data-sys/access_level_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/access_level_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_access_level_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_access_level_dao.cpp$(PreprocessSuffix): ../src/data-sys/access_level_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_access_level_dao.cpp$(PreprocessSuffix) ../src/data-sys/access_level_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_protocol_dao.cpp$(ObjectSuffix): ../src/data-sys/protocol_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/protocol_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_protocol_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_protocol_dao.cpp$(PreprocessSuffix): ../src/data-sys/protocol_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_protocol_dao.cpp$(PreprocessSuffix) ../src/data-sys/protocol_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_security_dao.cpp$(ObjectSuffix): ../src/data-sys/security_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/security_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_security_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_security_dao.cpp$(PreprocessSuffix): ../src/data-sys/security_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_security_dao.cpp$(PreprocessSuffix) ../src/data-sys/security_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_session_stats_dao.cpp$(ObjectSuffix): ../src/data-sys/session_stats_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/session_stats_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_session_stats_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_session_stats_dao.cpp$(PreprocessSuffix): ../src/data-sys/session_stats_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_session_stats_dao.cpp$(PreprocessSuffix) ../src/data-sys/session_stats_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_users_dao.cpp$(ObjectSuffix): ../src/data-sys/users_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/users_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_users_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_users_dao.cpp$(PreprocessSuffix): ../src/data-sys/users_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_users_dao.cpp$(PreprocessSuffix) ../src/data-sys/users_dao.cpp

$(IntermediateDirectory)/up_src_data-sys_text_prompts_dao.cpp$(ObjectSuffix): ../src/data-sys/text_prompts_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-sys/text_prompts_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-sys_text_prompts_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-sys_text_prompts_dao.cpp$(PreprocessSuffix): ../src/data-sys/text_prompts_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-sys_text_prompts_dao.cpp$(PreprocessSuffix) ../src/data-sys/text_prompts_dao.cpp

$(IntermediateDirectory)/up_src_forms_form_system_config.cpp$(ObjectSuffix): ../src/forms/form_system_config.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/forms/form_system_config.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_forms_form_system_config.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_forms_form_system_config.cpp$(PreprocessSuffix): ../src/forms/form_system_config.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_forms_form_system_config.cpp$(PreprocessSuffix) ../src/forms/form_system_config.cpp

$(IntermediateDirectory)/up_src_data-app_oneliners_dao.cpp$(ObjectSuffix): ../src/data-app/oneliners_dao.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/data-app/oneliners_dao.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_data-app_oneliners_dao.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_data-app_oneliners_dao.cpp$(PreprocessSuffix): ../src/data-app/oneliners_dao.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_data-app_oneliners_dao.cpp$(PreprocessSuffix) ../src/data-app/oneliners_dao.cpp

$(IntermediateDirectory)/up_src_sdl2_net_SDLnet.cpp$(ObjectSuffix): ../src/sdl2_net/SDLnet.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/sdl2_net/SDLnet.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_sdl2_net_SDLnet.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_sdl2_net_SDLnet.cpp$(PreprocessSuffix): ../src/sdl2_net/SDLnet.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_sdl2_net_SDLnet.cpp$(PreprocessSuffix) ../src/sdl2_net/SDLnet.cpp

$(IntermediateDirectory)/up_src_sdl2_net_SDLnetselect.cpp$(ObjectSuffix): ../src/sdl2_net/SDLnetselect.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/sdl2_net/SDLnetselect.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_sdl2_net_SDLnetselect.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_sdl2_net_SDLnetselect.cpp$(PreprocessSuffix): ../src/sdl2_net/SDLnetselect.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetselect.cpp$(PreprocessSuffix) ../src/sdl2_net/SDLnetselect.cpp

$(IntermediateDirectory)/up_src_sdl2_net_SDLnetTCP.cpp$(ObjectSuffix): ../src/sdl2_net/SDLnetTCP.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/sdl2_net/SDLnetTCP.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_sdl2_net_SDLnetTCP.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_sdl2_net_SDLnetTCP.cpp$(PreprocessSuffix): ../src/sdl2_net/SDLnetTCP.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetTCP.cpp$(PreprocessSuffix) ../src/sdl2_net/SDLnetTCP.cpp

$(IntermediateDirectory)/up_src_sdl2_net_SDLnetUDP.cpp$(ObjectSuffix): ../src/sdl2_net/SDLnetUDP.cpp 
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/admin/code/Oblivion2-XRM/src/sdl2_net/SDLnetUDP.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_src_sdl2_net_SDLnetUDP.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_src_sdl2_net_SDLnetUDP.cpp$(PreprocessSuffix): ../src/sdl2_net/SDLnetUDP.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_src_sdl2_net_SDLnetUDP.cpp$(PreprocessSuffix) ../src/sdl2_net/SDLnetUDP.cpp

##
## Clean
##
clean:
	$(RM) -r Debug/


