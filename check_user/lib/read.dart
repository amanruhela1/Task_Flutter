import 'dart:io';

void main() {
  final rootDirectory = Directory('C:/Users/Aman Ruhela/Desktop/Exon Saha/Task/task/lib/');
  printFiles(rootDirectory);
}

void printFiles(Directory directory, {String parentPath = ''}) {
  final files = directory.listSync();

  for (final entity in files) {
    if (entity is File) {
      final fileName = entity.uri.pathSegments.last;
      print('$parentPath - $fileName');
    } else if (entity is Directory) {
      final folderName = entity.uri.pathSegments.last;
      final newParentPath = parentPath.isEmpty ? folderName : '$parentPath - $folderName';
      printFiles(entity, parentPath: newParentPath);
    }
  }
}
