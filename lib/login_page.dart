import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return (SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'VetCall',
              style: TextStyle(
                  fontSize: 55.0, fontFamily: 'Signatra', color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                height: 20,
              ),
              const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  )
              ),
              Container(
                height: 20,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
              ),
              const RaisedButton(
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: null,
              ),
              const RaisedButton(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: null,
              ),
            ],
          ),
        )));
  }
}
