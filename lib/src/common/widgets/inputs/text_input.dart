import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../common.dart';

class COSTextInput<T> extends StatelessWidget {
  const COSTextInput({
    super.key,
    required this.control,
    this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.label,
    this.validationMessages,
    this.onTap,
    this.valueAccessor,
    this.selectable = true,
  });

  final String? label;
  final FormControl<T> control;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final void Function(FormControl<T> control)? onSubmitted;
  final void Function(FormControl<T> control)? onChanged;
  final Map<String, String Function(Object)>? validationMessages;
  final void Function(FormControl<T> control, BuildContext context)? onTap;
  final ControlValueAccessor<T, String>? valueAccessor;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: kSemiBoldTextStyle.copyWith(fontSize: 14.sp)),
        ReactiveTextField(
          formControl: control,
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization ?? TextCapitalization.words,
          textInputAction: textInputAction,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          style: kRegularTextStyle.copyWith(fontSize: 14.sp),
          decoration: inputDecoration(context, hint: hint, prefixIcon: prefixIcon),
          onTapOutside: (event) => control.unfocus(),
          validationMessages: validationMessages,
          onTap: (control) => onTap?.call(control, context),
          valueAccessor: valueAccessor,
          enableInteractiveSelection: selectable,
          showCursor: selectable,
        ),
      ],
    );
  }
}
