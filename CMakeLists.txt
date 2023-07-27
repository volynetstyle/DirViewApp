cmake_minimum_required(VERSION 3.16)

project(DivView VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appDivView
    index.cpp
)

set_source_files_properties(src/constants/Colors.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appDivView
    URI DivView
    VERSION 1.0
    QML_FILES
        "App.qml"
        "src/pages/About.qml"
        "src/constants/Colors.qml"
        "src/modules/FileSystemView.qml"
        "src/components/Icon.qml"
        "src/pages/MyMenu.qml"
        "src/modules/MyMenuBar.qml"
        "src/components/Sidebar.qml"
        "src/components/ResizeButton.qml"
        "src/events/WindowDragHandler.qml"
    RESOURCES
        "icons/folder_closed.svg"
        "icons/folder_open.svg"
        "icons/generic_file.svg"
        "icons/globe.svg"
        "icons/info_sign.svg"
        "icons/light_bulb.svg"
        "icons/read.svg"
        "icons/resize.svg"
        "icons/qt_logo.svg"
     SOURCES
        filesystemmodel.cpp
        filesystemmodel.h
)

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
