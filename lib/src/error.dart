import 'package:fluent/src/parser.dart';

class SyntaxErrorException implements Exception {
  final String message;
  final SourcePosition position;
  SyntaxErrorException(this.message, this.position);
  String toString() => "Syntax error: $message (at ${position.filename}: Ln ${position.line}, Col ${position.column})";
}

class RuntimeException implements Exception {
  final String message;
  RuntimeException(this.message);
  String toString() => "Reference error: $message";
}