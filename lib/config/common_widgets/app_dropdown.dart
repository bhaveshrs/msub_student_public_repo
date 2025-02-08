import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:msub/config/common_widgets/apptext.dart';
import 'package:msub/config/resource/app_colors.dart';
import 'package:msub/config/resource/app_textstyles.dart';


class CommonDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final String? labelText;
  final ValueChanged<String?> onChanged;
  final double menuItemHeight;
  final TextStyle? hintStyle;
  final TextStyle? itemTextStyle;
  final Icon dropdownIcon;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final BoxDecoration? dropdownDecoration;
  final TextStyle Function(int index, String item)? dynamicItemTextStyle;

  final bool isExpanded;
  final bool isDense;

  const CommonDropdown({
    super.key,
    this.isExpanded = false,
    this.labelText,
    this.dynamicItemTextStyle,
    this.isDense = false,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.hintText = "--Choose--",
    this.menuItemHeight = 35,
    this.hintStyle,
    this.itemTextStyle,
    this.dropdownIcon =
        const Icon(Icons.keyboard_arrow_down_outlined, size: 16),
    this.buttonPadding,
    this.buttonDecoration,
    this.dropdownDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          AppText(
            text: labelText!,
            style: AppTextStyles.pop12Reg(color: MyAppColors.grey),
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
        ],
        DropdownButton2<String>(
          isDense: isDense,
          isExpanded: isExpanded,
          value: selectedValue,
          hint: Text(hintText,
              style: hintStyle ??
                  AppTextStyles.pop15Reg(color: MyAppColors.inActiveText)),
          items: items.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return DropdownMenuItem<String>(
              value: item,
              child: FittedBox(
                child: Text(item,
                    style: dynamicItemTextStyle?.call(index, item) ??
                        AppTextStyles.pop14Reg()),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            padding: buttonPadding ??
                const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: buttonDecoration ??
                const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
          ),
          menuItemStyleData: MenuItemStyleData(height: menuItemHeight),
          dropdownStyleData: DropdownStyleData(
            decoration: dropdownDecoration ??
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
          ),
          iconStyleData: IconStyleData(icon: dropdownIcon),
          underline: const SizedBox(), // Removes default underline
        ),
      ],
    );
  }
}
