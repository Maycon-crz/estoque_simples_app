import 'package:estoque_simples_app/pages/custom_widgets/custom_card.dart';
import 'package:estoque_simples_app/routes/route_names.dart';
import 'package:flutter/material.dart';

class DashbaordPage extends StatelessWidget {
  const DashbaordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Painel de Controle"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.login);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(19),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    width: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Text("QTD Fornecedores"),
                        Text("9"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(9),
                    width: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Text("QTD Produtos"),
                        Text("10"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: CustomCard(
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage('https://picsum.photos/200'),
                        // ),
                        title: 'Fornecedores',
                        // subtitle: 'Uma descrição curta aqui',
                        // trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.suppliers,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: CustomCard(
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage('https://picsum.photos/200'),
                        // ),
                        title: 'Produtos',
                        // subtitle: 'Uma descrição curta aqui',
                        // trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          // ação ao tocar
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: CustomCard(
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage('https://picsum.photos/200'),
                        // ),
                        title: 'Funcionarios',
                        // subtitle: 'Uma descrição curta aqui',
                        // trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          // ação ao tocar
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
