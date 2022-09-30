import 'package:flutter/material.dart';

class BingoCard extends StatefulWidget {
  const BingoCard({Key? key}) : super(key: key);

  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {
  @override
  Widget build(BuildContext context) {
    return _bingoCard(/*200*/);
  }

  Widget _bingoCard(/*double _width*/) {
    return Material(
      elevation: 25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.6364,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          child: Row(
              children: [
                Container(
                  width: 72,
                  height: MediaQuery.of(context).size.width*0.6364,
                  child: _GridViewLetter(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-72,
                  height: MediaQuery.of(context).size.width*0.6364,
                  color: Colors.brown,
                  child: _GridViewNumber(),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _GridViewLetter() {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      ),
      children: [
        _cardLetter("B", Colors.green, Colors.white),
        _cardLetter("I", Colors.green, Colors.white),
        _cardLetter("N", Colors.green, Colors.white),
        _cardLetter("G", Colors.green, Colors.white),
        _cardLetter("O", Colors.green, Colors.white),
      ],
    );
  }

  Widget _cardLetter(String letter, Color colorBackground, Color colorText) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorBackground,
      ),
      child: Center(
        child: Text(letter, style: TextStyle(color: colorText, fontSize: 25),),
      ),
    );
  }

  Widget _ButtonNumber(String number,Color colorBackground, Color colorText){
    return InkWell(
      onTap: (){},
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorBackground,
        ),
        child: Center(
          child: Text(number, style: TextStyle(color: colorText, fontSize: 25),),
        ),
      ),
    );
  }

  Widget _GridViewNumber(){
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
      ),
      children: [
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
        _ButtonNumber("1", Colors.green, Colors.white),
        _ButtonNumber("2", Colors.green, Colors.white),
        _ButtonNumber("3", Colors.green, Colors.white),
        _ButtonNumber("4", Colors.green, Colors.white),
        _ButtonNumber("5", Colors.green, Colors.white),
      ],
    );
  }
}