import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetcall/services/auth_service.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return (SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'VetCall',
          style: TextStyle(
              fontSize: 55.0, fontFamily: 'Signatra', color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(
              'Log in',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: null,
          ),
          RaisedButton(
            child: Text(
              'Sign out',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              authService.signOut();
            },
          ),
          const TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
          )),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
          )
        ],
      ),
    )));
  }
}
