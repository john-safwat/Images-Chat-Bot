import 'dart:io';

void main() {
  const String assetsDir = "assets/images";
  const String outputFile = "lib/gen/assets.dart";

  final buffer = StringBuffer();
  buffer.writeln("// GENERATED FILE - DO NOT MODIFY MANUALLY");
  buffer.writeln("// Run `dart generate_assets.dart` to regenerate.");
  buffer.writeln("\nclass Assets {");

  final directory = Directory(assetsDir);
  if (directory.existsSync()) {
    final files = directory.listSync().whereType<File>();
    for (var file in files) {
      final fileName = file.uri.pathSegments.last;
      final variableName = _toCamelCase(fileName.split('.').first);
      buffer.writeln("  static const String $variableName = '$assetsDir/$fileName';");
    }
  } else {
    print("❌ Directory '$assetsDir' not found!");
    return;
  }

  buffer.writeln("}\n");

  final outputDir = Directory("lib/gen");
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  File(outputFile).writeAsStringSync(buffer.toString());
  print("✅ Assets file generated at: $outputFile");
}

/// Converts file names to camelCase
String _toCamelCase(String fileName) {
  final words = fileName.split(RegExp(r'[_\s-]+'));
  return words.asMap().entries.map((entry) {
    if (entry.key == 0) {
      return entry.value.toLowerCase();
    }
    return entry.value[0].toUpperCase() + entry.value.substring(1).toLowerCase();
  }).join();
}