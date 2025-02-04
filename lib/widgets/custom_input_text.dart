import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msub/common/utils/app_colors.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FormFieldValidator<String>? validator;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final bool? isObscureText;
  final TextCapitalization? textCapitalization;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? successMessage;
  final String? errorMessage;
  final bool validateOnInputChange;
  final bool showValidationIcons;
  final TextAlign validationMessageAlignment;
  final TextAlign textAlignment; // New parameter for input text alignment

  CustomTextInput({
    Key? key,
    required this.controller,
    this.labelText,
    required this.keyboardType,
    this.prefixIcon,
    this.hintText,
    this.floatingLabelBehavior,
    this.validator,
    this.enable,
    this.onChanged,
    this.isObscureText,
    this.textCapitalization,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.successMessage,
    this.errorMessage,
    this.validateOnInputChange = true,
    this.showValidationIcons = true,
    this.validationMessageAlignment = TextAlign.start,
    this.textAlignment = TextAlign.start, // Default to start alignment
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _obscureText = false;
  bool _isValid = true; // Default is valid
  bool _showValidationMessage = false; // Only show messages after certain events

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText ?? false;
  }

  void _validateInput(String value) {
    if (widget.validator != null) {
      setState(() {
        _isValid = widget.validator!(value) == null;
        _showValidationMessage = true; // Show messages after validation
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(color: AppColors.black),
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textAlign: widget.textAlignment, // Use the new text alignment parameter
          onChanged: (value) {
            widget.onChanged?.call(value);

            // Only validate on input change if the flag is enabled
            if (widget.validateOnInputChange) {
              _validateInput(value);
            }
          },
          onFieldSubmitted: (value) {
            // Always validate on submission or when focus is lost
            _validateInput(value);
          },
          obscureText: _obscureText,
          textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
          minLines: widget.minLines ?? 1,
          maxLines: widget.isObscureText == true ? 1 : widget.maxLines,
          inputFormatters: [
            if (widget.maxLength != null) LengthLimitingTextInputFormatter(widget.maxLength),
          ],
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            enabled: widget.enable ?? true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: widget.prefixIcon,
            )
                : null,
            labelText: widget.labelText,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(18),
            labelStyle: const TextStyle(fontSize: 16, color: AppColors.black),
            hintStyle: const TextStyle(fontSize: 16, color: AppColors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColors.white),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
            floatingLabelBehavior: widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
            suffixIcon: widget.showValidationIcons && _showValidationMessage
                ? Icon(
              _isValid ? Icons.check_circle_outline : Icons.error_outline,
              color: _isValid ? Colors.green : Colors.red,
            )
                : null,
          ),
        ),
        const SizedBox(height: 8), // Space between input and message
        if (_showValidationMessage && _isValid && widget.successMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              widget.successMessage!,
              style: const TextStyle(color: AppColors.green, fontSize: 14),
              textAlign: widget.validationMessageAlignment,
            ),
          ),
        if (_showValidationMessage && !_isValid && widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              widget.errorMessage!,
              style: const TextStyle(color: AppColors.red, fontSize: 14),
              textAlign: widget.validationMessageAlignment,
            ),
          ),
      ],
    );
  }
}


