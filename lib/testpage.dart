import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
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
        children: const [
          RaisedButton(
            child: Text(
              'Log in',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: null,
          ),
          RaisedButton(
            child: Text(
              'Register',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: null,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            )
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password'
          ),
        )
        ],
      ),
    )));
  }
}
