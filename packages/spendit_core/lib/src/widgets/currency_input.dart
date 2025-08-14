import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit_core/spendit_core.dart';

class SiCurrencyField extends StatefulWidget {
  const SiCurrencyField({
    super.key,
    required this.formControl,
    this.maxValue = 1000000000,
    this.readOnly = false,
    this.onChanged,
    this.placeholder,
  });

  final FormControl<int> formControl;
  final int maxValue;
  final bool readOnly;
  final ValueChanged<FormControl<int>>? onChanged;
  final String? placeholder;

  @override
  State<SiCurrencyField> createState() => _SiCurrencyFieldState();
}

class _SiCurrencyFieldState extends State<SiCurrencyField> {
  late CurrencyTextEditingController _currencyController;
  late CurrencyValueAccessor _valueAccessor;

  @override
  void initState() {
    super.initState();
    _valueAccessor = CurrencyValueAccessor();
    _currencyController = CurrencyTextEditingController(
      formControl: widget.formControl,
      maxValue: widget.maxValue,
    );

    // Set initial value to show "Rp "
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (_currencyController.text.isEmpty) {
    //     _currencyController.text = 'Rp ';
    //   }
    // });
  }

  @override
  void dispose() {
    _currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControl: widget.formControl,
      controller: _currencyController,
      valueAccessor: _valueAccessor,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      readOnly: widget.readOnly,
      enableInteractiveSelection: !widget.readOnly,
      onChanged: widget.onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: SiTextStyles.semibold.copyWith(fontSize: 24),
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: SiTextStyles.semibold.copyWith(fontSize: 24),
      ),
    );
  }
}

// Custom ValueAccessor dengan max value limit dan format currency
class CurrencyValueAccessor extends ControlValueAccessor<int, String> {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  CurrencyValueAccessor();

  @override
  String? modelToViewValue(int? modelValue) {
    if (modelValue == null) return 'Rp ';
    return _currencyFormatter.format(modelValue);
  }

  @override
  int? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty || viewValue == 'Rp ') return null;

    // Remove currency symbol and all non-digit characters
    String cleanValue = viewValue
        .replaceAll('Rp ', '')
        .replaceAll('Rp', '')
        .replaceAll(RegExp(r'[^\d]'), '');

    if (cleanValue.isEmpty) return null;

    int? parsed = int.tryParse(cleanValue);

    // Return the parsed value even if it exceeds max (validation will handle it)
    return parsed;
  }
}

// Custom TextEditingController dengan max value limit dan smart cursor
class CurrencyTextEditingController extends TextEditingController {
  final FormControl<int> formControl;
  final int maxValue;
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  bool _isUpdating = false;
  bool _isOverLimit = false;
  String _previousText = 'Rp ';
  int _previousCursorPos = 3;

  CurrencyTextEditingController({required this.formControl, required this.maxValue}) {
    // Listen to form control changes
    formControl.valueChanges.listen((value) {
      if (!_isUpdating && value != null) {
        _updateTextFromFormValue(value);
      }
    });

    // Listen to text changes
    addListener(_onTextChanged);
  }

  bool get isOverLimit => _isOverLimit;

  void _onTextChanged() {
    if (_isUpdating) return;

    final currentText = text;
    final currentSelection = selection;
    final currentCursorPos = currentSelection.baseOffset;

    // Handle empty or "Rp " only text
    if (currentText.isEmpty || currentText == 'Rp ') {
      _isOverLimit = false;
      _updateFormValue(null);
      _previousText = currentText.isEmpty ? 'Rp ' : currentText;
      _previousCursorPos = currentText.isEmpty ? 3 : currentCursorPos;

      // Ensure "Rp " is displayed when empty
      if (currentText.isEmpty) {
        _isUpdating = true;
        value = TextEditingValue(text: 'Rp ', selection: TextSelection.collapsed(offset: 3));
        _isUpdating = false;
      }
      return;
    }

    // Extract digits only
    String cleanValue = currentText
        .replaceAll('Rp ', '')
        .replaceAll('Rp', '')
        .replaceAll(RegExp(r'[^\d]'), '');

    if (cleanValue.isEmpty) {
      _isOverLimit = false;
      _updateFormValue(null);
      _isUpdating = true;
      value = TextEditingValue(text: 'Rp ', selection: TextSelection.collapsed(offset: 3));
      _isUpdating = false;
      return;
    }

    // Parse to integer
    int? intValue = int.tryParse(cleanValue);
    if (intValue != null) {
      // Check if value exceeds maximum
      if (intValue > maxValue) {
        _isUpdating = true;
        _isOverLimit = true;

        int? previousValue = formControl.value;
        if (previousValue != null) {
          String previousFormattedText = _currencyFormatter.format(previousValue);
          value = TextEditingValue(
            text: previousFormattedText,
            selection: TextSelection.collapsed(offset: previousFormattedText.length),
          );
        } else {
          value = TextEditingValue(text: 'Rp ', selection: TextSelection.collapsed(offset: 3));
          _updateFormValue(null);
        }

        _isUpdating = false;
        return;
      }

      _isOverLimit = false;
      String formattedText = _currencyFormatter.format(intValue);

      if (currentText != formattedText) {
        _isUpdating = true;

        // Calculate new cursor position
        int newCursorPosition = _calculateNewCursorPosition(
          previousText: _previousText,
          previousCursorPos: _previousCursorPos,
          currentText: currentText,
          currentCursorPos: currentCursorPos,
          formattedText: formattedText,
        );

        value = TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: newCursorPosition),
        );

        _previousText = formattedText;
        _previousCursorPos = newCursorPosition;

        _isUpdating = false;
      }

      _updateFormValue(intValue);
    }
  }

  // Improved cursor calculation
  int _calculateNewCursorPosition({
    required String previousText,
    required int previousCursorPos,
    required String currentText,
    required int currentCursorPos,
    required String formattedText,
  }) {
    // Safety bounds - cursor can't be before "Rp "
    if (currentCursorPos <= 3) return 3;

    // Count digits before cursor in the current (unformatted) input
    String beforeCursor = currentText.substring(0, currentCursorPos);
    int digitsBeforeCursor = beforeCursor
        .replaceAll('Rp ', '')
        .replaceAll('Rp', '')
        .replaceAll(RegExp(r'[^\d]'), '')
        .length;

    // Find position after the Nth digit in formatted text
    return _findPositionAfterNthDigit(formattedText, digitsBeforeCursor);
  }

  // Helper to find position after the Nth digit in formatted text
  int _findPositionAfterNthDigit(String formattedText, int targetDigitCount) {
    if (targetDigitCount <= 0) return 3; // After "Rp "

    int digitCount = 0;
    for (int i = 3; i < formattedText.length; i++) {
      if (formattedText[i].contains(RegExp(r'\d'))) {
        digitCount++;
        if (digitCount == targetDigitCount) {
          return i + 1; // Position after this digit
        }
      }
    }

    // If we don't have enough digits, return end position
    return formattedText.length;
  }

  void _updateFormValue(int? value) {
    if (formControl.value != value) {
      _isUpdating = true;
      formControl.updateValue(value);
      _isUpdating = false;
    }
  }

  void _updateTextFromFormValue(int value) {
    _isUpdating = true;
    String formattedText = _currencyFormatter.format(value);
    text = formattedText;
    _previousText = formattedText;
    _previousCursorPos = formattedText.length;
    _isOverLimit = value > maxValue;
    _isUpdating = false;
  }

  // Method untuk set value secara programmatic
  void setIntValue(int value) {
    int cappedValue = value > maxValue ? maxValue : value;
    _updateFormValue(cappedValue);
  }

  // Method untuk clear value
  @override
  void clear() {
    _isUpdating = true;
    value = TextEditingValue(text: 'Rp ', selection: TextSelection.collapsed(offset: 3));
    _previousText = 'Rp ';
    _previousCursorPos = 3;
    _isUpdating = false;
    _isOverLimit = false;
    _updateFormValue(null);
  }

  // Get current integer value
  int? get intValue {
    if (text.isEmpty || text == 'Rp ') return null;
    String cleanValue = text
        .replaceAll('Rp ', '')
        .replaceAll('Rp', '')
        .replaceAll(RegExp(r'[^\d]'), '');
    int? parsed = int.tryParse(cleanValue);
    return parsed != null && parsed > maxValue ? maxValue : parsed;
  }
}
