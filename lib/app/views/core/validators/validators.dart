import 'package:flutter/material.dart';

class RegisterValidators {
  RegisterValidators._();
  static FormFieldValidator compare(
      TextEditingController? valueEC, String message) {
    return (value) {
      final valueCompare = valueEC?.text ?? '';
      if (value == null || value != null && value != valueCompare) {
        return message;
      }
    };
  }
}
