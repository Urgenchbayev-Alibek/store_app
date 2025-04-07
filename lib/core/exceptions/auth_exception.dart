class AuthException implements Exception {
  final message;

 AuthException({required this.message});

 @override
  String toString() {

    return message;
  }
}