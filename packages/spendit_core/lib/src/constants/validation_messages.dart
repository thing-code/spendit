import 'package:reactive_forms/reactive_forms.dart';

Map<String, String Function(Object)> requiredValidationMsg(String fieldName) =>
    {ValidationMessage.required: (control) => '$fieldName harus diisi.'};
