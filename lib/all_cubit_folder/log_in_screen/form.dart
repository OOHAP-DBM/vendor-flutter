class LogInFormState {
  final String mobileno;
  final String email;

  // Validation flags
  final bool ismobilenovalid;
  final bool isemailvalid;
  final bool isuservalid;

  const LogInFormState({
    this.mobileno = '',
    this.email = '',
    this.ismobilenovalid = false,
    this.isemailvalid = false,
    this.isuservalid = false,
  });

  LogInFormState copyWith({
    String? mobileno,
    String? email,
    bool? ismobilenovalid,
    bool? isemailvalid,
    bool? isuservalid,
  }) {
    return LogInFormState(
      mobileno: mobileno ?? this.mobileno,
      email: email ?? this.email,
      ismobilenovalid: ismobilenovalid ?? this.ismobilenovalid,
      isemailvalid: isemailvalid ?? this.isemailvalid,
      isuservalid: isuservalid ?? this.isuservalid,
    );
  }
}
