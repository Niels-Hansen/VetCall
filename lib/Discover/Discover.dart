import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vetcall/Discover/VetCards.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscoverState();
  }
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // Top row with the menu button and profile button
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu, size: 30, color: Colors.black,),
                    onPressed: (){},
                  ),
                  Container(margin: EdgeInsets.only(left: 150),child: Image(image: AssetImage('images/logo.png'), height: 50,)),
                ],
              ),
              // space between top row and text below
              SizedBox(
                height: 5,
                width: double.infinity,
              ),
              // The text below the top row. "Hello. Where would you like to go"
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: 'Discover \n', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Colors.black)),
                          TextSpan(text: 'Veterinarians near you ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black)),
                        ]
                    ),
                  ),
                ),
              ),
              // space..
              SizedBox(height: 20,),
              // row with widgets of places to go, that the user can select.
              Center(child: VetCards()),
            ],
          ),
        ),
      ),
    );
  }
}