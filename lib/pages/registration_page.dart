import 'package:estoque_simples_app/blocs/login/login_bloc.dart';
import 'package:estoque_simples_app/blocs/login/login_event.dart';
import 'package:estoque_simples_app/blocs/login/login_state.dart';
import 'package:estoque_simples_app/pages/custom_widgets/custom_text_form_field.dart';
import 'package:estoque_simples_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastre-se'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login realizado com sucesso!")),
              );
            }
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 90),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    label: "E-mail",
                    onChanged: (value) => bloc.add(LoginUserNameChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Nome",
                    onChanged: (value) => bloc.add(LoginUserNameChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Sobrenome",
                    onChanged: (value) => bloc.add(LoginUserNameChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Usuario",
                    onChanged: (value) => bloc.add(LoginUserNameChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Senha",
                    onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Confirme sua Senha",
                    onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
                  ),
                  const SizedBox(height: 30),
                  if (state.isLoading)
                    const CircularProgressIndicator()
                  else
                    SizedBox(
                      width: double.infinity,
                      height: 39,
                      child: ElevatedButton(
                        onPressed: () => bloc.add(LoginSubmitted()),
                        child: const Text("Cadastrar"),
                      ),
                    ),
                  const SizedBox(height: 13),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.login,
                      );
                    },
                    child: const Text("Voltar para o Login"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
