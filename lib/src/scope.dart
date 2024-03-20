import 'ast.dart';
import 'bundle.dart';

class Scope {
  // The bundle for which the given resolution is happening.
  final FluentBundle bundle;
  // The list of errors collected while resolving.
  final List<Exception>? errors;
  // A dict of developer-provided variables.
  final Map<String, dynamic> args;

  /// The Set of patterns already encountered during this resolution.
  /// Used to detect and prevent cyclic resolutions.
  Set<Pattern> dirty = Set<Pattern>();
  // A dict of parameters passed to a TermReference.
  Map<Symbol, dynamic>? params;

  /// The running count of placeables resolved so far. Used to detect the
  /// Billion Laughs and Quadratic Blowup attacks.
  int placeables = 0;

  Scope(this.bundle, this.args, this.errors, [this.params]);

  void reportError(Exception error) {
    if (this.errors == null) {
      throw error;
    } else {
      this.errors?.add(error);
    }
  }
}
