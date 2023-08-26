import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/common/widgets/text_form_field.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    this.onQuery,
    this.onTap,
    this.hintText,
    this.readOnly = false,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String query)? onQuery;
  final VoidCallback? onTap;
  final String? hintText;
  final bool readOnly;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      readOnly: readOnly,
      hintText: hintText,
      hintStyle:
          context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
      fillColor: AppColors.textColorWhite,
      prefixIcon: Icon(
        Icons.search,
        color: AppColors.primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 1),
      onChanged: onQuery,
      onTap: onTap,
      suffixIcon: suffixIcon,
    );
  }
}
