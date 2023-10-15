#include "filesystemmodel.h"

#include <QMimeDatabase>
#include <QStandardPaths>

FileSystemModel::FileSystemModel(QObject *parent) : QFileSystemModel(parent)
{
    setRootPath(QStandardPaths::writableLocation(QStandardPaths::HomeLocation));
}

int FileSystemModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 1;
}

QString FileSystemModel::readFile(const QString &filePath)
{
    if (filePath.isEmpty())
        return {};

    QFile file(filePath);

    if (file.size() >= 2'000'000)
        return tr("File size is too big.\nYou can read files up to %1 MB.").arg(2);

    static const QMimeDatabase db;
    const QMimeType mime = db.mimeTypeForFile(QFileInfo(file));

    const auto mimeTypesForFile = mime.parentMimeTypes();

    for (const auto &m : mimeTypesForFile) {
        bool isTextInM = m.contains("text", Qt::CaseInsensitive);
        bool isTextInMimeComment = mime.comment().contains("text", Qt::CaseInsensitive);

        if (isTextInM || isTextInMimeComment) {
            if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
                return tr("Error opening the File!");
            }
            QTextStream stream(&file);
            return stream.readAll();
        }
    }
    return tr("Filetype not supported!");
}
