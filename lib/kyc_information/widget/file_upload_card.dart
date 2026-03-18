import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FileUploadCard extends StatefulWidget {
  final String label;
  final FileType fileType;
  final List<String>? extensions;

  const FileUploadCard({
    super.key,
    required this.label,
    this.fileType = FileType.any,
    this.extensions,
  });

  @override
  State<FileUploadCard> createState() => _FileUploadCardState();
}

class _FileUploadCardState extends State<FileUploadCard> {
  String? _selectedFilePath;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: widget.fileType,
      allowedExtensions: widget.extensions,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
      });
    }
  }

  String _fileName(String path) {
    return path.split(RegExp(r'[\\/]')).last; // Windows + Unix path support
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE6E6E6)),
        ),
        child: Center(
          child: _selectedFilePath == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.file_upload_outlined,
                      size: 44,
                      color: Color(0xFF717182),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF717182)),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.fileType == FileType.image
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(_selectedFilePath!),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.broken_image_outlined,
                                size: 44,
                                color: Color(0xFF717182),
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.insert_drive_file_outlined,
                            size: 44,
                            color: Colors.green,
                          ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        _fileName(_selectedFilePath!),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xFF717182)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
