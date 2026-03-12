import 'package:flutter/material.dart';

class LabelTextfieldCard extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;

  const LabelTextfieldCard({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false, required TextEditingController controller,
  });

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        obscureText: isPassword,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 13, color: Color(0xFFB5B5BE)),
          filled: true,
          fillColor: const Color(0xFFF5F5F7),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility_outlined, size: 18)
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0.53, color: Color(0xFFE6E6E6)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        _buildTextField(hint, isPassword: isPassword),
      ],
    );
  }
}