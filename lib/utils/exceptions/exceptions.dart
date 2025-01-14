abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, [this.stackTrace]);

  @override
  String toString() {
    final trace = stackTrace != null ? '\nStackTrace: $stackTrace' : '';
    return '$runtimeType: $message$trace';
  }
}
