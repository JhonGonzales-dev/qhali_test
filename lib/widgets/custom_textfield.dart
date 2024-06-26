import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.nameField,
    this.maxLength = 100,
    this.maxLines = 1,
    this.validator,
    this.textInputType = TextInputType.text,
    this.inputFormater,
    this.onChanged,
    this.initialValue,
    this.isReadOnly = false,
    this.onTap,
    this.labelText,
    this.prefixIcon,
    this.errorText,
    this.obsecureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });
  final String? initialValue;
  final String nameField;
  final int maxLength;
  final int maxLines;
  final Widget? prefixIcon;
  final bool obsecureText;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormater;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final String? labelText;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      name: nameField,
      onTap: onTap,
      obscureText: obsecureText,
      readOnly: isReadOnly,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormater,
      keyboardType: textInputType,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        counterText: "",
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
    );
  }
}
