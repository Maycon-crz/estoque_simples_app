import 'package:estoque_simples_app/blocs/login/login_bloc.dart';
import 'package:estoque_simples_app/blocs/login/login_event.dart';
import 'package:estoque_simples_app/blocs/login/login_state.dart';
import 'package:estoque_simples_app/pages/custom_widgets/custom_text_form_field.dart';
import 'package:estoque_simples_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      /*
      * O BlocProvider serve para injetar um Bloc (ou Cubit) no widget 
      tree do Flutter, permitindo que widgets filhos acessem e usem 
      esse Bloc sem precisar criar instâncias manuais.
      * Ele cria e fornece o Bloc.
      * Os widgets filhos podem acessar o mesmo Bloc com 
      context.read<Bloc>() ou context.watch<Bloc>().
      */
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Iniciar Sessão'),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            /*
            * * O BlocConsumer é um widget que serve para ouvir e reagir às mudanças de estado de um Bloc.
            * Ele combina o que o BlocBuilder e o BlocListener fazem:
            * * builder → reconstrói a UI sempre que o estado mudar.
            * * listener → executa ações únicas que não fazem parte da UI (ex: mostrar SnackBar, navegar para outra tela, exibir dialog).
            */
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login realizado com sucesso!")),
              );
              Navigator.pushReplacementNamed(context, RouteNames.dashboard);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 130),
                  const SizedBox(height: 90),
                  CustomTextFormField(
                    label: "Usuario",
                    onChanged: (value) => bloc.add(LoginUserNameChanged(value)),
                  ),
                  const SizedBox(height: 9),
                  CustomTextFormField(
                    label: "Senha",
                    activeObscureText: true,
                    onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
                  ),
                  const SizedBox(height: 30),
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          height: 39,
                          child: ElevatedButton(
                            onPressed: () => bloc.add(LoginSubmitted()),
                            child: const Text("Entrar"),
                          ),
                        ),
                  const SizedBox(height: 19),
                  SizedBox(
                    width: double.infinity,
                    height: 39,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.refistration,
                        );
                      },
                      child: const Text("Cadastre-se"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
