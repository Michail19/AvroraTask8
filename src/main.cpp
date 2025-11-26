#include <auroraapp.h>
#include <QtQuick>
#include <QGeoRoute>
#include <QGeoCoordinate>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.template"));
    application->setApplicationName(QStringLiteral("Coordinates"));

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/Coordinates.qml")));
    view->show();

    return application->exec();
}
