import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_issues_flutter_app_test/core/extensions/build_context.dart';
import 'package:github_issues_flutter_app_test/core/resources/resources.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hintStyle,
      this.labelStyle,
      this.errorStyle,
      this.labelText,
      this.hintText,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.inputFormatters,
      this.fillColor,
      this.onTap,
      this.readOnly,
      this.enabled,
      this.showCounter = false,
      this.borderColor,
      this.onChanged,
      this.focusNode,
      this.maxLength,
      this.maxLines,
      this.keyboardType,
      this.validator,
      this.autoValidateMode,
      this.prefixIconColor,
      this.suffixIconColor,
      this.isObscure,
      this.border,
      this.contentPadding});

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? enabled;
  final bool showCounter;
  final AutovalidateMode? autoValidateMode;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final int? maxLength;
  final int? maxLines;
  final bool? isObscure;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final EdgeInsets? contentPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      autovalidateMode: widget.autoValidateMode,
      validator: widget.validator,
      controller: widget.controller,
      style: context.textTheme.titleMedium,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      onChanged: (value) {
        if (value.isEmpty || value.length == 1) {
          setState(() {});
        }
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
          counter: widget.showCounter ? null : const Offstage(),
          labelText: widget.labelText,
          labelStyle: widget.labelStyle ??
              context.textTheme.bodyLarge?.copyWith(
                color: AppColors.textLightColor,
                fontWeight: FontWeight.w500,
              ),
          fillColor: widget.fillColor ?? AppColors.cardBackgroundColor,
          filled: true,
          errorText: widget.errorText,
          errorStyle: context.textTheme.labelMedium
              ?.copyWith(color: AppColors.errorColor),
          suffixIcon: widget.suffixIcon ?? clearSuffixIcon,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: AppColors.headlineTextColor,
          border: widget.border ??
              OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.headlineTextColor),
              ),
          enabledBorder: widget.border ??
              OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.outlinedTextColor),
              ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          contentPadding: widget.contentPadding),
      obscureText: widget.isObscure ?? false,
      obscuringCharacter: '*',
    );
  }

  IconButton? get clearSuffixIcon => widget.controller.text.isNotEmpty
      ? IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              widget.controller.clear();
            });
          },
        )
      : null;
}
