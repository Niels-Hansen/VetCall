import 'package:flutter/material.dart';
import 'dart:async';
import 'test_page.dart';
import 'login_page.dart';
import 'account_type_page.dart';
import 'receipt_page.dart';

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
        home: ReceiptPage());
  }
}
