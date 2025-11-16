import 'package:estoque_simples_app/pages/dashboard_page.dart';
import 'package:estoque_simples_app/pages/login_page.dart';
import 'package:estoque_simples_app/pages/registration_page.dart';
import 'package:estoque_simples_app/pages/suppliers_page.dart';
import 'package:estoque_simples_app/routes/route_names.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  /*
    Este código define as rotas de navegação do aplicativo, para poder usar o Navigator.pushNamed.
  */
  static final Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.login: (context) => const LoginPage(),
    RouteNames.dashboard: (context) => const DashbaordPage(),
    RouteNames.refistration: (context) => const RegistrationPage(),
    RouteNames.suppliers: (context) => const SuppliersPage(),
  };
}
