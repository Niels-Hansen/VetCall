import 'package:flutter/material.dart';

class AccountTypePage extends StatefulWidget {
  @override
  _AccountTypePageState createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 375,
      height: 667,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          color: Colors.white),
      child: Column(
        children: [
          Container(width: 72, height: 30),
          const Text("Choose Account Type",
              style: TextStyle(
                  color: Color(0xff88d9de),
                  fontWeight: FontWeight.w500,
                  fontFamily: "HelveticaNeue",
                  fontStyle: FontStyle.normal,
                  fontSize: 50.0)),
          Container(
              width: 142,
              height: 126,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Color(0xff88d9de), width: 1),
                  color: Color(0xff88d9de)),
              child: Text("Vet",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "HelveticaNeue",
                      fontStyle: FontStyle.normal,
                      fontSize: 31.0)))
        ],
      ),
    ));
  }
}
