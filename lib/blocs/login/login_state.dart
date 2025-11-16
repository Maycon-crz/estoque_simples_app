
// login_state.dart
class LoginState {
  final String username;
  final String password;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  LoginState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
