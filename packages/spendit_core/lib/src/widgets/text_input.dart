import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit_core/spendit_core.dart';

class SiTextInput<T> extends StatelessWidget {
  const SiTextInput({
    super.key,
    required this.control,
    this.placeholder,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.capitalization,
    this.maxLines = 1,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.onSubmitted,
    this.onChanged,
    this.validationMessages,
    this.onTap,
    this.valueAccessor,
    this.isSelectable = true,
  });

  final FormControl<T> control;
  final String? placeholder;
  final bool isPassword;
  final TextInputType inputType;
  final TextCapitalization? capitalization;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? suffix;
  final ValueChanged<FormControl<T>>? onSubmitted;
  final ValueChanged<FormControl<T>>? onChanged;
  final Map<String, String Function(Object)>? validationMessages;
  final ValueChangedWithContext<FormControl<T>>? onTap;
  final ControlValueAccessor<T, String>? valueAccessor;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControl: control,
      textAlignVertical: TextAlignVertical.center,
      obscureText: isPassword,
      keyboardType: inputType,
      textCapitalization: capitalization ?? TextCapitalization.words,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      readOnly: !isSelectable,
      enableInteractiveSelection: isSelectable,
      showErrors: (control) => control.invalid && control.touched,
      validationMessages: validationMessages,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: (value) => onTap?.call(control, context),
      valueAccessor: valueAccessor,
      showCursor: isSelectable,
      style: SiTextStyles.medium.copyWith(fontSize: 16),
      cursorHeight: 16,
      decoration: InputDecoration(
        prefixIcon: prefix != null
            ? Padding(padding: const EdgeInsets.only(left: 8), child: prefix)
            : null,
        suffixIcon: suffix != null
            ? Padding(padding: EdgeInsets.only(right: 8), child: suffix)
            : null,
        labelText: placeholder,
      ),
    );
  }
}
//                   