import 'package:bff_prueba/core/constants/theme.dart';
import 'package:bff_prueba/presentation/cubit/auth/auth_cubit.dart';
import 'package:bff_prueba/presentation/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bff_prueba/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userCredentials = new Map();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _form(BuildContext context) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: 70,
                ),
                child: Center(
                  child: Text(
                    '¡Hola!',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: SEC_BUTTON_COLOR),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                  top: 27,
                ),
                child: Center(
                  child: Text(
                    'Ya te extrañabamos',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: SEC_TEXT_COLOR),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 44, left: 23, right: 23),
                child: Container(
                  height: 40,
                  child: Form(
                    child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(209, 209, 209, 1),
                            fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: 'Correo electrónico')),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 24, left: 23, right: 23),
                child: Container(
                  height: 40,
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(209, 209, 209, 1),
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: 'Contaseña',
                      )),
                )),
            Padding(
              padding: EdgeInsets.only(top: 13, left: 31),
              child: Text(
                'Olvidaste tu contraseña?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(168, 63, 248, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28),
              child: Center(
                child: Container(
                  width: 181,
                  height: 40,
                  child: TextButton(
                    child: Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => _handleSubmit(context),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(0, 163, 236, 1))),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthInitial) {
          return _form(context);
        } else if (state is AuthLogged) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        return _form(context);
      }),
    );
  }

  _handleSubmit(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    authCubit.signInWithEmailAndPassword(
        _emailController.text, _passwordController.text);
  }
}
