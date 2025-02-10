import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.txtController,
    this.maxLines = 1,
    this.validator,
    this.keyBoarType,
    this.readOnly = false,
    this.textColor,
    this.inputFormatters,
    this.onChanged,
  });

  final TextEditingController txtController;
  final int maxLines;
  final TextInputType? keyBoarType;
  bool readOnly;
  String? Function(String?)? validator;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      keyboardType: keyBoarType,
      validator: validator,
      controller: txtController,
      maxLines: maxLines,
      style: TextStyle(color: textColor ?? Theme.of(context).textTheme.bodyLarge?.color),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
    );
  }
}
