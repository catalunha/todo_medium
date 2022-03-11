class TaskServiceException implements Exception {
  final String message;
  TaskServiceException({
    required this.message,
  });
}
