import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelfieUploadCard extends StatefulWidget {
  final String label;
  final double height;

  const SelfieUploadCard({super.key, required this.label, this.height = 150});

  @override
  State<SelfieUploadCard> createState() => _SelfieUploadCardState();
}

class _SelfieUploadCardState extends State<SelfieUploadCard> {
  File? _imageFile;

  Future<void> _pickSelfie() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickSelfie,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE6E6E6)),
        ),
        child: _imageFile == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 44,
                    color: Color(0xFF717182),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.label,
                    style: const TextStyle(color: Color(0xFF717182)),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "PNG, JPG up to 10MB",
                    style: TextStyle(fontSize: 12, color: Color(0xFF9A9AA5)),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _imageFile!,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Click to replace",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF717182),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
