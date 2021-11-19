import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AddCreditcardPage extends StatefulWidget {
  @override
  _AddCreditcardPageState createState() => _AddCreditcardPageState();
}

class _AddCreditcardPageState extends State<AddCreditcardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 375,
            height: 667,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 30),
                color: Colors.white),
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 17.0,
                    color: Color(0xff88d9de),
                  ),
                ),
              ),
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
              const Text("Add credit card",
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
                    border:
                        Border.all(color: const Color(0xff979797), width: 1),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Text("Card number",
                      style: const TextStyle(
                          color: const Color(0xffaaadad),
                          fontWeight: FontWeight.w300,
                          fontFamily: "HelveticaNeue",
                          fontStyle: FontStyle.normal,
                          fontSize: 17.0)),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                width: 276,
                alignment: Alignment.centerLeft,
                child: Text("Expiration date?",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: const Color(0xffaaadad),
                        fontWeight: FontWeight.w300,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 17.0)),
              ),
              Container(
                height: 10,
              ),
              Container(
                  width: 276,
                  height: 44.509433962264154,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: const Color(0xff979797), width: 1),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("12",
                              style: const TextStyle(
                                  color: const Color(0xffaaadad),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "HelveticaNeue",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17.0)),
                        ),
                      ),
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: const Color(0xff979797), width: 1),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("2012",
                              style: const TextStyle(
                                  color: const Color(0xffaaadad),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "HelveticaNeue",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 17.0)),
                        ),
                      )
                    ],
                  )),
              Container(
                height: 20,
              ),
              Container(
                width: 130,
                height: 44.509433962264154,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border:
                        Border.all(color: const Color(0xff979797), width: 1),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Text("CCV",
                      style: const TextStyle(
                          color: const Color(0xffaaadad),
                          fontWeight: FontWeight.w300,
                          fontFamily: "HelveticaNeue",
                          fontStyle: FontStyle.normal,
                          fontSize: 17.0)),
                ),
              ),
              Container(
                height: 20,
              ),
              // save button
              Container(
                  width: 275,
                  height: 46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      border:
                          Border.all(color: const Color(0xff7a67fe), width: 1),
                      color: const Color(0xff7a67fe)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Submit",
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
