import 'package:flutter/services.dart';
import 'package:spendit/src/common/common.dart';

class COSNumberInput extends COSTextInput<String> {
  COSNumberInput({
    super.key,
    required super.control,
    super.hint,
    super.label,
    super.prefixIcon,
    super.textInputAction,
    super.validationMessages,
    super.onSubmitted,
    super.onChanged,
  }) : super(
         keyboardType: TextInputType.numberWithOptions(),
         maxLength: 17,
         inputFormatters: [FilteringTextInputFormatter.digitsOnly, ThousandFormatter()],
       );
}
