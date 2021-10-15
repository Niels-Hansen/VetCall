import 'package:flutter/material.dart';
import 'dart:async';
import 'testpage.dart';
import 'loginpage.dart';
import 'account_type_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'VetCall',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: AccountTypePage());
  }
}
