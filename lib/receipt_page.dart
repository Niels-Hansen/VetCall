import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ReceiptPage extends StatefulWidget {
  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return (Container(
        width: 375,
        height: 667,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 30),
            color: Colors.white),
        child: Column(children: [
          Container(
            width: 72,
            height: 30,
            child: Image.asset('images/logo_cover.png'),
          ),
          Container(
            height: 50,
          ),
          const Text("Receipt",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff88d9de),
                  fontWeight: FontWeight.w500,
                  fontFamily: "HelveticaNeue",
                  fontStyle: FontStyle.normal,
                  fontSize: 45.0)),
          Container(
            height: 100,
          ),
        ])));
  }
}
