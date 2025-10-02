import 'package:flutter/services.dart';
import 'package:spendit/src/common/common.dart';

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
