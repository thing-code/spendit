import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit_core/spendit_core.dart';

class SpendItNumberInput extends StatefulWidget {
  const SpendItNumberInput({super.key, required this.formControl, this.includeDecimal});

  final FormControl<String> formControl;
  final bool? includeDecimal;

  @override
  State<SpendItNumberInput> createState() => _SpendItNumberInputState();
}

class _SpendItNumberInputState extends State<SpendItNumberInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged() {
    final String currentText = _controller.text;
    final int currentCursorPosition = _controller.selection.baseOffset;

    // Bersihkan input, hanya angka dan koma yang diizinkan
    String cleanedText = currentText.replaceAll(RegExp(r'[^0-9,]'), '');

    List<String> parts = cleanedText.split(',');
    if (parts.length > 1 && parts[1].length > 2) {
      cleanedText = '${parts[0]},${parts[1].substring(0, 2)}';
    } else if (cleanedText.split(',').length > 2) {
      cleanedText = currentText; // Revert jika ada lebih dari satu koma
    }

    String formattedIntegerPart = '';
    String formattedDecimalPart = '';

    parts = cleanedText.split(',');
    if (parts.isNotEmpty) {
      formattedIntegerPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      );
    }
    if (parts.length > 1) {
      formattedDecimalPart = ',${parts[1]}';
    }

    final String formattedText = formattedIntegerPart + formattedDecimalPart;

    // Hitung offset kursor baru setelah pemformatan
    int newCursorPosition = formattedText.length;
    if (currentText.isNotEmpty && formattedText.isNotEmpty) {
      // Usahakan untuk mempertahankan posisi kursor relatif
      double ratio = currentCursorPosition / currentText.length;
      newCursorPosition = (ratio * formattedText.length).round();
      newCursorPosition = newCursorPosition.clamp(0, formattedText.length);
    }

    // Update teks dan posisi kursor
    if (formattedText != currentText) {
      _controller.value = _controller.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: newCursorPosition),
      );
    } else {
      // Jika teks tidak berubah, pertahankan posisi kursor
      _controller.selection = TextSelection.collapsed(offset: currentCursorPosition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      controller: _controller,
      formControl: widget.formControl,
      keyboardType: TextInputType.numberWithOptions(decimal: widget.includeDecimal),
      style: SpendItTextStyles.semibold.copyWith(fontSize: 28),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        filled: false,
        hintText: '0',
        prefixText: 'Rp. ',
        suffixText: '    ',
        prefixStyle: SpendItTextStyles.regular.copyWith(
          fontSize: 16,
          color: SpendItColors.primaryColor.shade300,
        ),
        hintStyle: SpendItTextStyles.semibold.copyWith(
          fontSize: 28,
          color: SpendItColors.primaryColor.shade300,
        ),
      ),
    );
  }
}
