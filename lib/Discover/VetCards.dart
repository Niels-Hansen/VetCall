import 'package:flutter/cupertino.dart';
import 'package:vetcall/Discover/VetCard.dart';
import 'package:vetcall/Discover/VetPlace.dart';

class VetCards extends StatefulWidget {
  @override
  _VetCardsState createState() => _VetCardsState();
}

class _VetCardsState extends State {
  List<VetPlace> vets = [
    VetPlace(
      place: 'Gabriella\'s clinic',
      image:'gabriella.png',
      description: "Expert in dogs",
      price: 500,
      name: 'Gabriella',
      address: 'Paw Street 101',
    ),
    VetPlace(
      place: 'Lin\'s clinic',
      image:'lin.jpg',
      description: "Expert in Cats",
      price: 450,
      name: 'Lin',
      address: 'Whiskers road 118',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vets.length,
        itemBuilder: (_, index) {
          return VetCard(
            name: vets[index].name,
            picture: vets[index].image,
            price: vets[index].price,
            place: vets[index],
            description: vets[index].description,
            address: vets[index].address,
          );
        },
      ),
    );
  }
}