import 'package:flutter/material.dart';
import 'package:vetcall/Discover/VetPlace.dart';
import 'package:vetcall/video/video.dart';

class VetCard extends StatelessWidget {
  final String name;
  final String picture;
  final double price;
  VetPlace place;
  String description;
  String address;

  VetCard({required this.name, required this.picture, required this.price, required this.place,
    required this.description, required this.address});

  void _call(){

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => VideoConference()));
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(62, 168, 174, 201),
                  offset:Offset(0, 9),
                  blurRadius:20,
                ),
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  'images/$picture',
                  height: 400,
                  width: 309,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 30,
                  left: 5,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                        text: TextSpan(
                            children:[
                              TextSpan(
                                  text: '$name',
                                  style: TextStyle(
                                    fontSize: 22,
                                  )
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: -5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Text('$price DKK', style: TextStyle(color: Colors.black, fontSize: 12),),
                              Center(child: Text('HOUR', style: TextStyle(color: Colors.black, fontSize: 8),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 130,
                    width: 309,
                    color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                Container(margin: EdgeInsets.only(left: 10, top: 20), child: Align(alignment: Alignment.centerLeft, child: Text('$name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))),
                                Container(margin: EdgeInsets.only(left: 10),child: Align(alignment: Alignment.centerLeft, child: Text('$address', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),))),
                                Container(margin: EdgeInsets.only(left: 10),child: Align(alignment: Alignment.centerLeft, child: Text('$place', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),))),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.video_call, size: 30, color: Colors.green,),
                                onPressed: (){},
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}