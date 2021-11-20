import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'Discover/Discover.dart';

class Receipt extends StatelessWidget {
  final int seconds;

  Receipt({required this.seconds});


  @override
  Widget build(BuildContext context) {
    final secondPrice = 500/60/60;
    final secondPriceForPrint = secondPrice.toStringAsFixed(2);
    final price = (secondPrice * seconds).toStringAsFixed(2);

    void leave(BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Discover()));
    }

    Widget _toolbar() {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: RawMaterialButton(
          onPressed: () => leave(context),
          child: Icon(
            Icons.call_end,
            color: Colors.white,
            size: 35.0,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.redAccent,
          padding: const EdgeInsets.all(15.0),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Discover()));
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 17.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 30),
                color: Colors.white
            ),
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
                height: 50,
              ),
              Row(children: [
                Container(
                  width: 70,
                ),
                Text("Time: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
                Text('$seconds seconds',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
              ]),
              Container(
                height: 20,
              ),
              Row(children: [
                Container(
                  width: 70,
                ),
                const Text("Price pr. second: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
                Text('$secondPriceForPrint \$',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
              ]),
              Container(
                height: 50,
              ),
              Row(children: [
                Container(
                  width: 70,
                ),
                const Text("Total",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
                Container(
                  width: 62,
                ),
                Text('$price \$',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0)),
              ]),
              Container(
                  width: 281,
                  height: 2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff88d9de), width: 1)
                  )
              ),
              _toolbar(),
            ]
            ),
          ),
        ],
      ),
    );
  }
}
