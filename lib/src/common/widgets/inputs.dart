import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SiBaseInput<T> extends StatelessWidget {
  const SiBaseInput({
    super.key,
    required this.control,
    this.placeholder,
    this.label,
    this.valueAccessor,
    this.maxLines,
    this.inputType,
    this.obsecureText = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.readOnly = false,
    this.validationMessages,
    this.suffixIcon,
    this.prefixIcon,
  });

  final FormControl<T> control;
  final String? placeholder;
  final String? label;
  final ControlValueAccessor<T, String>? valueAccessor;
  final int? maxLines;
  final TextInputType? inputType;
  final bool obsecureText;
  final ValueChanged<FormControl<T>>? onChanged;
  final ValueChanged<FormControl<T>>? onSubmitted;
  final ValueChanged<FormControl<T>>? onTap;
  final bool readOnly;
  final Map<String, String Function(Object)>? validationMessages;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ?_label,
        ReactiveTextField<T>(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
          formControl: control,
          cursorHeight: 14,
          valueAccessor: valueAccessor,
          maxLines: maxLines,
          keyboardType: inputType,
          obscureText: obsecureText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          onTapOutside: (event) => control.unfocus(),
          readOnly: readOnly,
          validationMessages: validationMessages,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(padding: EdgeInsets.only(left: 8), child: prefixIcon)
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(padding: EdgeInsets.only(left: 8), child: suffixIcon)
                : null,
            hintText: placeholder,
          ),
        ),
      ],
    );
  }

  Widget? get _label {
    if (label == null) return null;
    return Text(
      label!,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}

class SiTextInput extends SiBaseInput<String> {
  const SiTextInput({
    super.key,
    required super.control,
    super.maxLines,
    super.readOnly,
    super.label,
    super.placeholder,
    super.onChanged,
    super.prefixIcon,
    super.suffixIcon,
    super.obsecureText,
    super.validationMessages,
  });
}
