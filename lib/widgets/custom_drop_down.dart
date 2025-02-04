import 'package:flutter/material.dart';
import 'package:msub/common/utils/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String hintText;
  final ValueChanged<String?>? onChanged;

  CustomDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color:AppColors.inActive,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.inActive,
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
