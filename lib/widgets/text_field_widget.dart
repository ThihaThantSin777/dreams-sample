import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.isAddValidator = false,
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
  });

  final bool isAddValidator;
  final String hintText;
  final IconData prefixIcon;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: null,
      validator: isAddValidator
          ? (text) {
              if (text == null || text.isEmpty) {
                return "Required";
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
