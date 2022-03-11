class HiveBaseException implements Exception {
  final String message;
  HiveBaseException({
    required this.message,
  });
}

class HiveICantOpenDirectoryException implements Exception {
  final String message;
  final int? code;

  HiveICantOpenDirectoryException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantOpenDirectoryException(message: $message, code: $code)';
}

class HiveICantInitException implements Exception {
  final String message;
  final int? code;

  HiveICantInitException({this.message = '', this.code});

  @override
  String toString() => 'HiveICantInitException(message: $message, code: $code)';
}

class HiveICantOpenTheBoxException implements Exception {
  final String message;
  final int? code;

  HiveICantOpenTheBoxException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantOpenTheBoxException(message: $message, code: $code)';
}

class HiveICantGetTheBoxException implements Exception {
  final String message;
  final int? code;

  HiveICantGetTheBoxException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantGetTheBoxException(message: $message, code: $code)';
}

class HiveUnregisteredBoxException implements Exception {
  final String message;
  final int? code;

  HiveUnregisteredBoxException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveUnregisteredBoxException(message: $message, code: $code)';
}

class HiveICantDeleteBoxException implements Exception {
  final String message;
  final int? code;

  HiveICantDeleteBoxException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantDeleteBoxException(message: $message, code: $code)';
}

class HiveICantGetValueException implements Exception {
  final String message;
  final int? code;

  HiveICantGetValueException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantGetValueException(message: $message, code: $code)';
}

class HiveICantPutValueException implements Exception {
  final String message;
  final int? code;

  HiveICantPutValueException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantPutValueException(message: $message, code: $code)';
}

class HiveICantAddValueException implements Exception {
  final String message;
  final int? code;

  HiveICantAddValueException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantAddValueException(message: $message, code: $code)';
}

class HiveICantCloseBoxesException implements Exception {
  final String message;
  final int? code;

  HiveICantCloseBoxesException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantCloseBoxesException(message: $message, code: $code)';
}

class HiveICantCloseBoxException implements Exception {
  final String message;
  final int? code;

  HiveICantCloseBoxException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantCloseBoxException(message: $message, code: $code)';
}

class HiveICantCastDataException implements Exception {
  final String message;
  final int? code;

  HiveICantCastDataException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantCastDataException(message: $message, code: $code)';
}

class HiveICantDeleteValueException implements Exception {
  final String message;
  final int? code;

  HiveICantDeleteValueException({this.message = '', this.code});

  @override
  String toString() =>
      'HiveICantDeleteValueException(message: $message, code: $code)';
}
