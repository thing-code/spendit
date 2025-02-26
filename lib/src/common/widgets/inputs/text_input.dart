import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common.dart';

class COSTextInput extends StatelessWidget {
  const COSTextInput({
    super.key,
    required this.controller,
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
  });

  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textInputAction: textInputAction,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: kRegularTextStyle.copyWith(fontSize: 14),
      decoration: inputDecoration(context, hint: hint, prefixIcon: prefixIcon),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }
}

class ThousandFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      if (newValue.text.isEmpty) {
        return newValue;
      }
      return newValue.copyWith(text: int.parse(newValue.text).thousand);
    }

    /// Kondisi jika input 0
    if (oldValue.text == '0') {
      int value = int.tryParse(newValue.text) ?? 0;

      return newValue.copyWith(
        text: value.toString(),
        selection: TextSelection.collapsed(offset: value.toInt().toString().length),
      );
    }

    /// Kondisi jika kursor berada pada . maka kursor dipindahkan ke angka sebelum titik
    if (oldValue.text.replaceAll(".", "") == newValue.text) {
      int value = int.tryParse(newValue.text) ?? 0;
      String newText = value.thousand;

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: oldValue.selection.baseOffset - 1),
      );
    }

    /// Jumlah titik sebelum perubahan
    int oldValueTotalPoint = '.'.allMatches(oldValue.text).length;

    /// Value akhir
    int value = int.tryParse(newValue.text) ?? 0;

    /// Value akhir yang terformat
    String newText = value.thousand;

    /// Jumlah titik setelah perubahan
    int newValueTotalPoint = '.'.allMatches(newText).length;

    /// Posisi kursor setelah terjadi perubahan
    int offset = newValue.selection.baseOffset + newValueTotalPoint;

    /// Kondisi jika di hapus baik dari belakang maupun tengah
    if (oldValue.text.replaceAll(".", "").length > newValue.text.length) {
      offset =
          oldValueTotalPoint > newValueTotalPoint
              ? oldValue.selection.baseOffset - 2
              : oldValue.selection.baseOffset - 1;
    }

    /// Nilai akhir yang ditampilkan
    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: offset));
  }
}
