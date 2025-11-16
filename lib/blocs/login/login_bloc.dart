import 'package:estoque_simples_app/blocs/login/login_event.dart';
import 'package:estoque_simples_app/blocs/login/login_state.dart';

// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginUserNameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      // Simula uma chamada de API com delay
      await Future.delayed(const Duration(seconds: 2));

      if (state.username == "admin" && state.password == "1234") {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "Usuário ou senha inválidos",
        ));
      }
    });
  }
}
