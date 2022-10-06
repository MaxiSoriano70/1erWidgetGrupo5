import 'package:flutter/material.dart';

class CustomButton{
  String? _valorView;
  bool? _check;
  Color? _backgroundPressedColor;
  Color? _defaultBackgroundColor;
  Color? _textColor;

  CustomButton(String valorView, Color defaultBackgroundColor,Color backgroundPressedColor, Color textColor){
    _valorView = valorView;
    _check = false;
    _backgroundPressedColor = _backgroundPressedColor;
    _defaultBackgroundColor = defaultBackgroundColor;
    _textColor = textColor;
  }

  Color get textColor => _textColor!;

  set textColor(Color value) {
    _textColor = value;
  }

  String get valorView => _valorView!;

  set valorView(String value) {
    _valorView = value;
  }

  bool get check => _check!;

  set check(bool value) {
    _check = value;
  }

  Color get defaultBackgroundColor => _defaultBackgroundColor!;

  set defaultBackgroundColor(Color value) {
    _defaultBackgroundColor = value;
  }
  Color get backgroundPressedColor => _backgroundPressedColor!;

  set backgroundPressedColor(Color value) {
    _backgroundPressedColor = value;
  }

  void _bingoCheck(Color defaultBackgroundColor, Color backgroundPressedColor){
    if(_check==false){
      _check = true;
      _defaultBackgroundColor = backgroundPressedColor;
      _textColor = Colors.white;
    }
    else{
      _check = false;
      _defaultBackgroundColor = defaultBackgroundColor;
      _textColor = Colors.black;
    }
  }

}

class BingoCard extends StatefulWidget {
  const BingoCard( {Key? key,
    required this.numbersList,
    this.colorBingo= Colors.teal,
    this.colorNumber = Colors.grey,
    this.colorNumberPressed= Colors.red,
    this.colorCard= Colors.white}) : super(key: key);
  final List<String> numbersList;
  final Color colorBingo;
  final Color colorNumber;
  final Color colorNumberPressed;
  final Color colorCard;
  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {

  List<CustomButton> listWithBingo=[];

  List<CustomButton> numbersList(List<String> list){
    int i=0;
    int position=0;
    while(i<40){
      if(i==0){
        var aux=CustomButton("B",widget.colorBingo,widget.colorBingo,Colors.white);
        listWithBingo.add(aux);
        i++;
      }
      else if(i==8){
        var aux=CustomButton("I",widget.colorBingo,widget.colorBingo,Colors.white);
        listWithBingo.add(aux);
        i++;
      }
      else if(i==16){
        var aux=CustomButton("N",widget.colorBingo,widget.colorBingo,Colors.white);
        listWithBingo.add(aux);
        i++;
      }
      else if(i==24){
        var aux=CustomButton("G",widget.colorBingo,widget.colorBingo,Colors.white);
        listWithBingo.add(aux);
        i++;
      }
      else if(i==32){
        var aux=CustomButton("O",widget.colorBingo,widget.colorBingo,Colors.white);
        listWithBingo.add(aux);
        i++;
      }
      else{
        var aux=CustomButton(list[position],widget.colorNumber,widget.colorNumberPressed,Colors.black);
        listWithBingo.add(aux);
        i++;
        position++;
      }
    }
    return listWithBingo;
  }

  void _checkColorButton(CustomButton button){
    button._bingoCheck(widget.colorNumber,widget.colorNumberPressed);
  }

  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width, widget.numbersList);
  }

  Widget _bingoCard(double width, List<String> dummyNumbers) {
    return Material(
        elevation: 25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: width,
            height: width*0.64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.colorCard,
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(width*0.072/2),
              itemCount: numbersList(dummyNumbers).length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: (width*0.072/2),
                  mainAxisSpacing: width*0.072/2
              ),
              itemBuilder: (context, index){
                return _letterOrNumber(context,index,width,numbersList(dummyNumbers)[index]);
              },
            ),
          ),
        ));
  }

  Widget _letterOrNumber(context, index,double width, CustomButton button){
    if(index==0 || index%8==0){
      return _cardLetter(context, index,width, button);
    }
    else {
      return _buttonNumber(context, index,width, button);
    }
  }

  Widget _cardLetter(context, index, double width, CustomButton button) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: width*0.072,
        height: width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: button._defaultBackgroundColor,
        ),
        child: Center(
          child: Text( button.valorView, style:
            TextStyle(color: button._textColor,fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index, double width, CustomButton button){
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
          color: button._defaultBackgroundColor,
        ),
        child: Center(
          child: Text(button.valorView,
            style: TextStyle(color: button._textColor,fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }
}