import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../providers/usage_provider.dart';

class ExportButton extends ConsumerWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.file_download),
      onSelected: (value) async {
        if (value == 'csv') {
          final result = await ref.read(exportUsageUseCaseProvider).executeCsv();
          result.fold(
            (l) => _showError(context, l.message),
            (csvString) => _saveFile(context, csvString, 'usage_export.csv'),
          );
        } else if (value == 'json') {
          final result = await ref.read(exportUsageUseCaseProvider).executeJson();
          result.fold(
            (l) => _showError(context, l.message),
            (jsonString) => _saveFile(context, jsonString, 'usage_export.json'),
          );
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'csv', child: Text('Export as CSV')),
        const PopupMenuItem(value: 'json', child: Text('Export as JSON')),
      ],
    );
  }

  void _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _saveFile(BuildContext context, String content, String filename) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsString(content);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved to ${file.path}')));
      }
    } catch (e) {
      if (context.mounted) {
        _showError(context, 'Failed to save file: $e');
      }
    }
  }
}
