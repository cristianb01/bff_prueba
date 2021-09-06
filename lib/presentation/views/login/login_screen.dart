import 'package:bff_prueba/presentation/views/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: LoginForm()),
    );
  }
}
