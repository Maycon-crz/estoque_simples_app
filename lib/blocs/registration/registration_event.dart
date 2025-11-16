abstract class RegistrationEvent {
  /* São ações que vêm da interface */
}

class RegistrationEmailChanged extends RegistrationEvent {
  final String email;
  RegistrationEmailChanged(this.email);
}

class RegistrationFirstNameChanged extends RegistrationEvent {
  final String firstName;
  RegistrationFirstNameChanged(this.firstName);
}

class RegistrationLastNameChanged extends RegistrationEvent {
  final String lastName;
  RegistrationLastNameChanged(this.lastName);
}

class RegistrationUserNameChanged extends RegistrationEvent {
  final String username;
  RegistrationUserNameChanged(this.username);
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;
  RegistrationPasswordChanged(this.password);
}

class RegistrationConfirmPasswordChanged extends RegistrationEvent {
  final String confirmPassword;
  RegistrationConfirmPasswordChanged(this.confirmPassword);
}

class RegistrationSubmitted extends RegistrationEvent {}
