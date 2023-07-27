#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setOrganizationName("QtProject");
    QGuiApplication::setApplicationName("File System Explorer");

    QQmlApplicationEngine engine;
    engine.loadFromModule("DivView", "Main");
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
