import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetcall/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    //Controllers for input

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return (SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
          ),
          Container(
            child: new Image.asset('images/logo.png'),
            height: 150,
          ),
          Container(height: 60),
          Container(
            height: 30,
            child: const Text(
              'Log in',
              style: TextStyle(
                  color: Color.fromRGBO(136, 217, 222, 1),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'HelveticaNeue',
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
          ),
          Container(
            width: 370,
<<<<<<< HEAD
            child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                )),
=======
            child: const TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            )),
>>>>>>> 84865be442220ed83dbe8a4ac77a966a28757967
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 370,
<<<<<<< HEAD
            child: TextField(
              controller: passwordController,
=======
            child: const TextField(
>>>>>>> 84865be442220ed83dbe8a4ac77a966a28757967
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
          Container(
            height: 20,
          ),
<<<<<<< HEAD
          InkWell(
              onTap: () {
                child:
                Container(child: const Text('Works'));
                authService.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
              },
              child: Container(
                width: 275,
                height: 46,
                decoration: BoxDecoration(
                    color: Color(0xff7a67fe),
                    border: Border.all(
                      color: Color(0xff7a67fe),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(22)),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Color(0xfffbfeff),
                      fontFamily: 'HelveticaNeue',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              )),
=======
          Container(
            width: 275,
            height: 46,
            decoration: BoxDecoration(
                color: Color(0xff7a67fe),
                border: Border.all(
                  color: Color(0xff7a67fe),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(22)),
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfffbfeff),
                  fontFamily: 'HelveticaNeue',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
          ),
>>>>>>> 84865be442220ed83dbe8a4ac77a966a28757967
          Container(
            child: const Text(
              'Forgot password',
              style: TextStyle(
                  color: Color.fromRGBO(136, 217, 222, 1),
                  fontFamily: 'HelveticaNeue'),
            ),
          ),
          Container(
            height: 10,
          ),
<<<<<<< HEAD
          InkWell(
              onTap: () async {
                await authService.createUserWithEmailAndPassword(
                    emailController.text, passwordController.text);
              },
              child: Container(
                  child: const Text(
                'Register',
                style: TextStyle(
                    color: Color.fromRGBO(136, 217, 222, 1),
                    fontFamily: 'HelveticaNeue'),
              )))
=======
          Container(
              child: const Text(
            'Register',
            style: TextStyle(
                color: Color.fromRGBO(136, 217, 222, 1),
                fontFamily: 'HelveticaNeue'),
          ))
>>>>>>> 84865be442220ed83dbe8a4ac77a966a28757967
        ],
      ),
    )));
  }
}
