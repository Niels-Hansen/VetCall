import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return (Container(
        width: 375,
        height: 667,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 30),
            color: Colors.white),
        child: Column(children: [
          // top logo
          Container(
            width: 72,
            height: 30,
            child: Image.asset('images/logo_cover.png'),
          ),
          Container(
            height: 20,
          ),
          // title
          const Text("Forgot password",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff88d9de),
                  fontWeight: FontWeight.w500,
                  fontFamily: "HelveticaNeue",
                  fontStyle: FontStyle.normal,
                  fontSize: 45.0)),
          Container(
            height: 40,
          ),
          // fields
          Container(
            width: 276,
            height: 44.509433962264154,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: const Color(0xff979797), width: 1),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text("Email",
                  style: const TextStyle(
                      color: const Color(0xffaaadad),
                      fontWeight: FontWeight.w300,
                      fontFamily: "HelveticaNeue",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0)),
            ),
          ),
          Container(
            height: 300,
          ),
          // save button
          Container(
              width: 275,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  border: Border.all(color: const Color(0xff7a67fe), width: 1),
                  color: const Color(0xff7a67fe)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Send",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: const Color(0xfffbfeff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 22.0)),
              )),
        ])));
  }
}
