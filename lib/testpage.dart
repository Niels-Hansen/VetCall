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
        title: Text(
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
              'Answer 1',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: null,
          ),
        ],
      ),
    )));
  }
}
