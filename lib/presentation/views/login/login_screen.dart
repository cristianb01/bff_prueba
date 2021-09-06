import 'package:bff_prueba/core/constants/theme.dart';
import 'package:bff_prueba/presentation/views/home/home_screen.dart';
import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Positioned(
//           top: 45,
//           bottom: 116,
//           left: 116,
//           child: Text(
//             'Inicio de sesion',
//             style: TextStyle(
//               color: TITLE_TEXT_COLOR,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     child: Image.asset('asset/images/flutter-logo.png')),
//               ),
//             ),
//             Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: 'Enter valid email id as abc@gmail.com'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 //TODO FORGOT PASSWORD SCREEN GOES HERE
//               },
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: 250,
//               decoration: BoxDecoration(
//                   color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               child: FlatButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => HomeScreen()));
//                 },
//                 child: Positioned(
//                   top: 424,
//                   left: 97,
//                   bottom: 97,
//                   right: 348,
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white, fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 130,
//             ),
//             Text('New User? Create Account')
//           ],
//         ),
//       ),
//     );
//   }
// }

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: 144,
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
                  child: TextField(
                      obscureText: true,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(209, 209, 209, 1),
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          labelText: 'Correo electrónico')),
                )),
            Padding(
                padding: EdgeInsets.only(top: 24, left: 23, right: 23),
                child: Container(
                  height: 40,
                  child: TextField(
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
                    onPressed: () {}, // implementar!
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
      )),
    );
  }
}
