import 'package:estoque_simples_app/blocs/registration/registration_database_helper.dart';
import 'package:estoque_simples_app/blocs/registration/registration_event.dart';
import 'package:estoque_simples_app/blocs/registration/registration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationDatabaseHelper _databaseHelper =
      RegistrationDatabaseHelper();

  RegistrationBloc() : super(RegistrationState()) {
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationFirstNameChanged>(_onFirstNameChanged);
    on<RegistrationLastNameChanged>(_onLastNameChanged);
    on<RegistrationUserNameChanged>(_onUserNameChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegistrationSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
      RegistrationEmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(email: event.email, errorMessage: null));
  }

  void _onFirstNameChanged(
      RegistrationFirstNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(firstName: event.firstName, errorMessage: null));
  }

  void _onLastNameChanged(
      RegistrationLastNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(lastName: event.lastName, errorMessage: null));
  }

  void _onUserNameChanged(
      RegistrationUserNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(username: event.username, errorMessage: null));
  }

  void _onPasswordChanged(
      RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(password: event.password, errorMessage: null));
  }

  void _onConfirmPasswordChanged(RegistrationConfirmPasswordChanged event,
      Emitter<RegistrationState> emit) {
    emit(state.copyWith(
        confirmPassword: event.confirmPassword, errorMessage: null));
  }

  Future<void> _onSubmitted(
      RegistrationSubmitted event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    //Validacoes
    if (state.email.isEmpty ||
        state.firstName.isEmpty ||
        state.lastName.isEmpty ||
        state.userName.isEmpty ||
        state.password.isEmpty ||
        state.confirmPassword.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Por favor, preencha todos os campos.',
        ),
      );
      return;
    }

    if (state.password != state.confirmPassword) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'As senhas não coincidem',
      ));
      return;
    }

    try {
      await _databaseHelper.insertUser({
        'email': state.email,
        'firstName': state.firstName,
        'lastName': state.lastName,
        'username': state.userName,
        'password': state.password, // TODO: Adicionar hash
      });

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Erro ao cadastrar: ${e.toString()}',
      ));
    }
  }
}
