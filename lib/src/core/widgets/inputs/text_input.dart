import 'inputs.dart';

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
