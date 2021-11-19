import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:vetcall/user_reg.dart';
import 'package:vetcall/vet_reg.dart';
//change

class AccountTypePage extends StatefulWidget {
  @override
  _AccountTypePageState createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Container(
      width: double.infinity,
      height: 667,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 30),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 30,
            child: Image.asset('images/logo.png'),
          ),
          Container(
            height: 20,
          ),
          const Text("Choose account type",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VetReg()),
                    );
                  },
                  child: Container(
                      width: 142,
                      height: 126,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border:
                              Border.all(color: Color(0xff88d9de), width: 1),
                          color: Color(0xff88d9de)),
                      child: Column(
                        children: [
                          Text("Vet",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "HelveticaNeue",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 31.0)),
                          Container(
                            height: 10,
                          ),
                          Icon(
                            Icons.local_hospital,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ],
                      ))),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserReg()),
                  );
                },
                child: Container(
                    width: 142,
                    height: 126,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Color(0xff88d9de), width: 1),
                      color: Color(0xff88d9de),
                    ),
                    child: Column(children: [
                      Text(
                        "User",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "HelveticaNeue",
                            fontStyle: FontStyle.normal,
                            fontSize: 31.0),
                      ),
                      Container(
                        height: 10,
                      ),
                      Icon(
                        Icons.person,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ])),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
