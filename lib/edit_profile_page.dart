import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
          const Text("Edit profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff88d9de),
                  fontWeight: FontWeight.w500,
                  fontFamily: "HelveticaNeue",
                  fontStyle: FontStyle.normal,
                  fontSize: 45.0)),
          Container(
            height: 50,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Image",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 140,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
          Container(
            height: 20,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Name, email",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 82,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
          Container(
            height: 20,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Company",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 110,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
          Container(
            height: 20,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Credit card",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 95,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
          Container(
            height: 20,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Rate",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 155,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
          Container(
            height: 20,
          ),
          Row(children: [
            Container(
              width: 70,
            ),
            const Text("Logout",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff090909),
                    fontWeight: FontWeight.w500,
                    fontFamily: "HelveticaNeue",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0)),
            Container(
              width: 132,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17.0,
              color: Colors.black,
            ),
          ]),
        ])));
  }
}
