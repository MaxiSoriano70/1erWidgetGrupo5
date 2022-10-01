import 'package:flutter/material.dart';

class BingoCard extends StatefulWidget {
  const BingoCard({Key? key}) : super(key: key);

  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {
  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width);
  }

  Widget _bingoCard(double _width) {
    return Material(
      elevation: 25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: _width,
          height:_width*0.6364,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
          ),
          child: Row(
              children: [
                Container(
                  width: _width/8 + _width*0.072,
                  height:_width*0.64,
                  child: _GridViewLetter(_width),
                ),
                Container(
                  width: _width-(_width/8 + _width*0.072),
                  height: _width*0.64,
                  color: Colors.brown,
                  child: _GridViewNumber(_width),)
            ],
          ),
        ),
      ),
    );
  }
_GridViewLetter(double _width)
{
  return GridView.count(
    primary: false,
    crossAxisCount: 1,
    padding: EdgeInsets.all((_width*0.072)/2),
    crossAxisSpacing: (_width*0.072)/2,
    mainAxisSpacing: (_width*0.072)/2,
    children: [
      _cardLetter("B", Colors.green, Colors.white,_width),
      _cardLetter("I", Colors.green, Colors.white,_width),
      _cardLetter("N", Colors.green, Colors.white,_width),
      _cardLetter("G", Colors.green, Colors.white,_width),
      _cardLetter("O", Colors.green, Colors.white,_width),
    ],
  );
}
 /* Widget _GridViewLetter(double _width) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: _width*0.072,
        crossAxisSpacing: _width*0.072,
      ),
      children: [
        _cardLetter("B", Colors.green, Colors.white,_width),
        _cardLetter("I", Colors.green, Colors.white,_width),
        _cardLetter("N", Colors.green, Colors.white,_width),
        _cardLetter("G", Colors.green, Colors.white,_width),
        _cardLetter("O", Colors.green, Colors.white,_width),
      ],
    );
  }*/

  Widget _cardLetter(String letter, Color colorBackground, Color colorText, double _width) {
    return Container(
      width: _width*0.072,
      height: _width*0.072,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorBackground,
      ),
      child: Center(
        child: Text(letter, style: TextStyle(color: colorText, fontSize: _width*0.036),),
      ),
    );
  }

  Widget _ButtonNumber(String number,Color colorBackground, Color colorText, double _width){
    return InkWell(
      onTap: (){},
      child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorBackground,
        ),
        child: Center(
          child: Text(number, style: TextStyle(color: colorText, fontSize: _width*0.036),),
        ),
      ),
    );
  }
Widget _GridViewNumber(double _width){
    return GridView.count(
      primary: false,
      crossAxisCount: 7,
      padding: EdgeInsets.only(right: _width*0.072, top: _width*0.072, bottom: _width*0.072),
      crossAxisSpacing: (_width*0.072)/2,
      mainAxisSpacing: (_width*0.072)/2,
      children: [
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
        _ButtonNumber("1", Colors.green, Colors.white,_width),
        _ButtonNumber("2", Colors.green, Colors.white,_width),
        _ButtonNumber("3", Colors.green, Colors.white,_width),
        _ButtonNumber("4", Colors.green, Colors.white,_width),
        _ButtonNumber("5", Colors.green, Colors.white,_width),
      ],
    );
}
 /* Widget _GridViewNumber(){
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 10,
          crossAxisSpacing: ()
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
  }*/
}