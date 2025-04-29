import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

class CardWidget extends StatelessWidget {
  final String? cardHolderName, expiryDate, phoneNumber, mobileNumber, division;

  final bool isNetworkImage;
  const CardWidget({
    super.key,
    required this.cardHolderName,
    this.expiryDate,
    this.phoneNumber,
    this.mobileNumber,
    this.division,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillFront,
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/card_front.png'),
          ),
        ),
      ),
      back: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/card_back.png'),
          ),
        ),
      ),
    );
  }
}
