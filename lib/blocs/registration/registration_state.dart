class RegistrationState {
  final String email;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final String confirmPassword;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  RegistrationState({
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  RegistrationState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    String? confirmPassword,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
