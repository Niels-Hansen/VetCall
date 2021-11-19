import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class EditImagePage extends StatefulWidget {
  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
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
            height: 20,
          ),
          const Text("Edit image",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff88d9de),
                  fontWeight: FontWeight.w500,
                  fontFamily: "HelveticaNeue",
                  fontStyle: FontStyle.normal,
                  fontSize: 45.0)),
          Container(
            height: 350,
          ),
          Container(
              width: 275,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  border: Border.all(color: const Color(0xff7a67fe), width: 1),
                  color: const Color(0xff7a67fe)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Save",
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
