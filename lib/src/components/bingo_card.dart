import 'package:flutter/material.dart';

class BingoCard extends StatefulWidget {
  const BingoCard({Key? key}) : super(key: key);

  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {
  @override
  Widget build(BuildContext context) {
    return _bingoCard(100);
  }

  Widget _bingoCard(double _width) {
    return Material(
      elevation: 25,
      child: Container(
        width: _width,
        height: _width * 0.6364,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey,
        ),
        child: Row(
            children: [
            _GridViewLetter(),
            _GridViewNumber()
        ],
      ),
    ),
    );
  }

  Widget _cardLetter(String letter, Color colorBackground, Color colorText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorBackground,
      ),
      child: Center(
        child: Text(letter, style: TextStyle(color: colorText, fontSize: 15),),
      ),
    );
  }

  Widget _ButtonNumber(String number,Color colorBackground, Color colorText){
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorBackground,
        ),
        child: Center(
          child: Text(number, style: TextStyle(color: colorText, fontSize: 15),),
        ),
      ),
    );
  }

  Widget _GridViewLetter() {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 5.0,
      reverse: false,
      children: [
        _cardLetter("b", Colors.green, Colors.white),
        _cardLetter("i", Colors.green, Colors.white),
        _cardLetter("n", Colors.green, Colors.white),
        _cardLetter("g", Colors.green, Colors.white),
        _cardLetter("o", Colors.green, Colors.white),
      ],
    );
  }

  Widget _GridViewNumber(){
    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 5.0,
      reverse: false,
      children: [
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
        _cardLetter("1", Colors.green, Colors.white),
        _cardLetter("2", Colors.green, Colors.white),
        _cardLetter("3", Colors.green, Colors.white),
        _cardLetter("4", Colors.green, Colors.white),
        _cardLetter("5", Colors.green, Colors.white),
      ],
    );
  }
}