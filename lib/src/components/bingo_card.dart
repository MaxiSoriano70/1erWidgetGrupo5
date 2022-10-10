import 'package:flutter/material.dart';

class CustomButton{
  String? _number;
  bool? _itsPressed;
  Color? _defaultBackgroundColor;
  Color? _pressedBackgroundColor;
  Color? _textColor;

  CustomButton(String number, Color defaultBackgroundColor, Color pressedBackgroundColor, Color textColor){
    _number = number;
    _itsPressed = false;
    _defaultBackgroundColor = defaultBackgroundColor;
    _pressedBackgroundColor = pressedBackgroundColor;
    _textColor = textColor;
  }

  String get number => _number!;
  set number(String number){
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

  void _hasBeenPressed(Color defaultBackgroundColor, Color pressedBackgroundColor){
    if (_itsPressed == false){
      _itsPressed = true;
      _defaultBackgroundColor = pressedBackgroundColor;
      _textColor = Colors.white;
    } else {
      _itsPressed = false;
      _defaultBackgroundColor = defaultBackgroundColor;
      _textColor = Colors.black;
    }
  }
}

class BingoCard extends StatefulWidget {
  final List<int> numbersList;
  final Color letterCardColor;
  final Color defaultBgNumberColor;
  final Color pressedBgNumberColor;
  final Color textColor;
  final Color cardColor;

  BingoCard({
    Key? key,
    required this.numbersList,
    this.letterCardColor = Colors.green,
    this.defaultBgNumberColor = Colors.grey,
    this.pressedBgNumberColor = Colors.red,
    this.textColor = Colors.black,
    this.cardColor = Colors.white,
  }) : super(key: key);


  @override
  State<BingoCard> createState() => _BingoCardState();
}


class _BingoCardState extends State<BingoCard> {
  List<CustomButton> customButtonList=[];
  List<CustomButton> listBuilder(){
    for(int i=0;i<35;i++){
      if(i>widget.numbersList.length){
        var aux = CustomButton("-",widget.defaultBgNumberColor,widget.pressedBgNumberColor,Colors.black);
        customButtonList.add(aux);
      }
      else{
        var aux = CustomButton(widget.numbersList[i].toString(),widget.defaultBgNumberColor,widget.pressedBgNumberColor,Colors.black);
        customButtonList.add(aux);
      }
    }
    return customButtonList;
  }



  void _checkColorButton(CustomButton button){
    button._hasBeenPressed(widget.defaultBgNumberColor,widget.pressedBgNumberColor);
  }
  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width, widget.numbersList);
  }

  Widget _bingoCard(double width, List<int> numbers) {
    double padding = width*0.72/2;
    //print(listBuilder());
    return Material(
      elevation: 25,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: width,
          height: width * 0.64,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.cardColor,),
          child: Row (children: [
            Container(width: width * 0.084, height: width * 0.64, color: Colors.pink,
              child: _wordBingo(width),),
            Container(width: width * 0.035, height: width * 0.64, color: Colors.black,),
            Container(width: width * 0.808, height: width * 0.64, color: Colors.red,
              child: _gridViewNumbers(width, listBuilder()),)
          ],),
        ),
      ),
    );
  }

  Widget _wordBingo(double width){
    List <String> word = ["B", "I", "N", "G", "0"];
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      itemCount: word.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: (width*0.072/2),
          mainAxisSpacing: width*0.072/2
      ),
      itemBuilder: (context, index){
        return _letterCard(width, word[index]);
      },
    );
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

  Widget _gridViewNumbers(double width, List<CustomButton> customButtonList){
    return GridView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      itemCount: customButtonList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: (width*0.072/2),
          mainAxisSpacing: width*0.072/2
      ),
      itemBuilder: (context, index){
        return _cardNumber(customButtonList[index],width);
      },
    );
  }

  Widget _cardNumber(CustomButton button,double width){
    return InkWell(
      onTap: (){
        setState(() {
          _checkColorButton(button);
        });
      },
      child: Container(
        width: width*0.072,
        height: width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: button._defaultBackgroundColor,),
        child: Center(
          child: Text(button._number.toString(),
            style: TextStyle(color: button._textColor, fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }
}