import 'package:estoque_simples_app/pages/custom_widgets/custom_text_form_field.dart';
import 'package:estoque_simples_app/routes/route_names.dart';
import 'package:flutter/material.dart';

class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fornecedores"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              RouteNames.dashboard,
            );
          },
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container();
            },
          ),
          const CustomTextFormField(),
        ],
      ),
    );
  }
}
