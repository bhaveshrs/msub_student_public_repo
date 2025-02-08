// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';
// import 'package:teachers_app/config/common_widgets/apptext.dart';
// import 'package:teachers_app/config/resource/app_colors.dart';
// import 'package:teachers_app/config/resource/app_textstyles.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
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
  final bool readOnly;
  final Color? labelColor;
  final bool showValidationIcons;
  final TextAlign validationMessageAlignment;
  final TextAlign textAlignment; // New parameter for input text alignment
  final Function? onTap;
  final double? radius;
  final double? contentPadValue;

  const CustomTextInput(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.labelColor,
      required this.keyboardType,
      this.prefixIcon,
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
      this.readOnly = false,
      this.showValidationIcons = true,
      this.validationMessageAlignment = TextAlign.start,
      this.textAlignment = TextAlign.start, // Default to start alignment
      this.onTap,
      this.radius,
      this.contentPadValue,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          AppText(
            text: labelText!,
            style:
                AppTextStyles.pop12Reg(color: labelColor ?? MyAppColors.grey),
          ),
          const SizedBox(height: 5),
        ],
        TextFormField(
          onTap: () => onTap?.call(),
          readOnly: readOnly,

          scrollPhysics:
              const ClampingScrollPhysics(), // Smooth horizontal scrolling

          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(color: MyAppColors.black),
          controller: controller,
          keyboardType: keyboardType,
          textAlign: textAlignment, // Use the new text alignment parameter
          onChanged: (value) {
            onChanged?.call(value);
          },
          onFieldSubmitted: (value) {},
          obscureText: isObscureText ?? false,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          minLines: minLines ?? 1,
          maxLines: isObscureText == true ? 1 : maxLines,
          inputFormatters: [
            if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            // isDense: true,
            fillColor: MyAppColors.white,
            filled: true,
            enabled: enable ?? true,

            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: prefixIcon,
                  )
                : null,
            hintText: hintText,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.all(contentPadValue ?? 9),
            labelStyle: const TextStyle(fontSize: 16, color: MyAppColors.black),
            hintStyle: AppTextStyles.pop15Reg(color: MyAppColors.inActiveText),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 15.0),
              borderSide: const BorderSide(color: MyAppColors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 15.0),
              borderSide: const BorderSide(color: MyAppColors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 15.0),
              borderSide: const BorderSide(color: MyAppColors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 15.0),
              borderSide: const BorderSide(color: MyAppColors.white),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyAppColors.red),
            ),
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
            // suffixIcon: widget.showValidationIcons && _showValidationMessage
            //     ? Icon(
            //         _isValid ? Icons.check_circle_outline : Icons.error_outline,
            //         color: _isValid ? Colors.green : Colors.red,
            //       )
            //     : null,
          ),
        ),
        // const SizedBox(height: 8),
        // if (_showValidationMessage && _isValid && widget.successMessage != null)
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 14.0),
        //     child: Text(
        //       widget.successMessage!,
        //       style: const TextStyle(color: MyAppColors.green, fontSize: 14),
        //       textAlign: widget.validationMessageAlignment,
        //     ),
        //   ),
        // if (_showValidationMessage && !_isValid && widget.errorMessage != null)
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 14.0),
        //     child: Text(
        //       widget.errorMessage!,
        //       style: const TextStyle(color: MyAppColors.red, fontSize: 14),
        //       textAlign: widget.validationMessageAlignment,
        //     ),
        //   ),
      ],
    );
  }
}
