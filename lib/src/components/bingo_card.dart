import 'package:flutter/material.dart';

class CustomButton{
  int? _number;
  bool? _itsPressed;
  Color? _defaultBackgroundColor;
  Color? _pressedBackgroundColor;
  Color? _textColor;

  CustomButton(int number, Color defaultBackgroundColor, Color pressedBackgroundColor, Color textColor){
    _number = number;
    _itsPressed = false;
    _defaultBackgroundColor = defaultBackgroundColor;
    _pressedBackgroundColor = pressedBackgroundColor;
    _textColor = textColor;
  }

  int get number => _number!;
  set number(int number){
    _number = number;
  }

  bool get itsPressed => _itsPressed!;
  set itsPressed(bool value){
    _itsPressed = value;
  }

  Color get defaultBackgroundColor => _defaultBackgroundColor!;
  set defaultBackgroundColor (Color color){
    _defaultBackgroundColor = color;
  }

  Color get pressedBackgroundColor => _pressedBackgroundColor!;
  set pressedBackgroundColor (Color color){
    _pressedBackgroundColor = color;
  }

  Color get textColor => _textColor!;
  set textColor (Color color){
    _textColor = color;
  }

  /*void _hasBeenPressed(Color defaultBackgroundColor, Color pressedBackgroundColor){
    if (_itsPressed == false){
      _itsPressed = true;
      _defaultBackgroundColor = pressedBackgroundColor;
      _textColor = Colors.white;
    } else {
      _itsPressed = false;
      _defaultBackgroundColor = defaultBackgroundColor;
      _textColor = Colors.black;
    }
  }*/
}

class BingoCard extends StatefulWidget {
  final List<int> numbersList;
  final Color letterCardColor;
  final Color defaultBgNumberColor;
  final Color pressedBgNumberColor;
  final Color textColor;
  final Color cardColor;

  const BingoCard({
    Key? key,
    required this.numbersList,
    this.letterCardColor = Colors.green,
    this.defaultBgNumberColor = Colors.grey,
    this.pressedBgNumberColor = Colors.red,
    this.textColor = Colors.black,
    this.cardColor = Colors.white
  }) : super(key: key);

  @override
  State<BingoCard> createState() => _BingoCardState();
}


class _BingoCardState extends State<BingoCard> {

  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width, widget.numbersList);
  }

  Widget _letterCard(double width, String text){
    return Container(
      width: width*0.072,
      height: width*0.072,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.letterCardColor,),
      child: Center(
        child: Text(text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: width*0.036),),
      ),
    );
  }

  Widget _wordBingo(double width){
    return GridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: (width*0.072/2),
      mainAxisSpacing: width*0.072/2,
      children: [
        _letterCard(width, "B"),
        _letterCard(width, "I"),
        _letterCard(width, "N"),
        _letterCard(width, "G"),
        _letterCard(width, "O"),
      ],
    );
  }

  Widget _cardNumber(double width){
    return InkWell(
      child: Container(
        width: width*0.072,
        height: width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.defaultBgNumberColor,),
        child: Center(
          child: Text("11",
            style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }

  Widget _gridViewNumbers(double width, List<int> numbers){
    return GridView.builder(
      itemCount: numbers.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: (width*0.072/2),
          mainAxisSpacing: width*0.072/2
      ),
      itemBuilder: (context, index){
        return _cardNumber(width);
      },
    );
  }

  Widget _bingoCard(double width, List<int> numbers) {
    return Material(
      elevation: 25,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: width,
          height: width * 0.64,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.cardColor,),
          child: Padding(
            padding: EdgeInsets.all(width*0.072/2),
            child: Row (children: [
              Container(width: width * 0.084, height: width * 0.64 - width*0.072/2, color: Colors.transparent,
                child: _wordBingo(width),),
              Container(width: width * 0.035, height: width * 0.64, color: Colors.transparent,),
              Container(width: width * 0.808, height: width * 0.64, color: Colors.transparent,
                child: _gridViewNumbers(width, numbers),)
            ],),
          ),
        ),
      ),
    );
  }
}