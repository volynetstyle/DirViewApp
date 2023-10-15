cmake_minimum_required(VERSION 3.16)

project(DivView VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appDivView "server/index.cpp"
)

set_source_files_properties(client/src/constants/Colors.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

file(GLOB_RECURSE QML_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "client/src/**/*.qml")
file(GLOB_RECURSE CPP_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "server/**/*.cpp")
file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "server/**/*.h")

add_executable(your_executable)
target_sources(your_executable PRIVATE ${QML_FILES_LIST} ${CPP_FILES_LIST} ${H_FILES_LIST})

qt6_add_qml_module(appDivView
    URI DivView
    VERSION 1.0
    QML_FILES
        "client/App.qml"
        ${QML_FILES}

    RESOURCES
            "client/icons/folder_closed.svg"
            "client/icons/folder_open.svg"
            "client/icons/generic_file.svg"
            "client/icons/globe.svg"
            "client/icons/info_sign.svg"
            "client/icons/light_bulb.svg"
            "client/icons/read.svg"
            "client/icons/resize.svg"
            "client/icons/qt_logo.svg"

    SOURCES
        ${CPP_FILES}
        ${H_FILES}
)

target_include_directories(appDivView PRIVATE server/plugins/FileSystem)

set_target_properties(appDivView PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDivView
    PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
)

install(TARGETS appDivView
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
