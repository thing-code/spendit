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
  });

  final FormControl<T> control;
  final String? placeholder;
  final String? label;
  final ControlValueAccessor<T, String>? valueAccessor;
  final int? maxLines;
  final TextInputType? inputType;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        ?_label,
        ReactiveTextField<T>(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
          formControl: control,
          cursorHeight: 14,
          valueAccessor: valueAccessor,
          maxLines: maxLines,
          keyboardType: inputType,
          obscureText: obsecureText,
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
