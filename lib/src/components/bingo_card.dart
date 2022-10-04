import 'package:flutter/material.dart';

class CustomButton{
  String? _valorView;
  bool? _check;
  Color? _colorBackgroundcheck;
  Color? _colorBackground;
  Color? _colorText;

  CustomButton(String valorView, Color colorBackground,Color colorBackgroundcheck, Color colorText){
    _valorView=valorView;
    _check=false;
    _colorBackgroundcheck=_colorBackgroundcheck;
    _colorBackground=colorBackground;
    _colorText=colorText;
  }

  Color get colorText => _colorText!;

  set colorText(Color value) {
    _colorText = value;
  }

  String get valorView => _valorView!;

  set valorView(String value) {
    _valorView = value;
  }

  bool get check => _check!;

  set check(bool value) {
    _check = value;
  }

  Color get colorBackground => _colorBackground!;

  set colorBackground(Color value) {
    _colorBackground = value;
  }
  Color get colorBackgroundcheck => _colorBackgroundcheck!;

  set colorBackgroundcheck(Color value) {
    _colorBackgroundcheck = value;
  }

  void _bingoCheck(Color colorBackground, Color colorBackgroundcheck){
    if(_check==false){
      _check=true;
      _colorBackground=colorBackgroundcheck;
      _colorText=Colors.white;
    }
    else{
      _check=false;
      _colorBackground=colorBackground;
      _colorText=Colors.black;
    }
  }

}

class BingoCard extends StatefulWidget {
  const BingoCard( {Key? key,
    required this.listWithNumbers,
    this.colorBingo= Colors.teal,
    this.colorNumber = Colors.grey,
    this.colorNumberPressed= Colors.red,
    this.colorCard= Colors.white}) : super(key: key);
  final List<String> listWithNumbers;
  final Color colorBingo;
  final Color colorNumber;
  final Color colorNumberPressed;
  final Color colorCard;
  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {
  //LISTA DE NUMERO CON BINGO
  List<CustomButton> listWithBingo=[];
  //METODO PARA AGREGAR BINGO
  List<CustomButton> listWithLetters(List<String> list){
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
    return _bingoCard(MediaQuery.of(context).size.width, widget.listWithNumbers);
  }

  Widget _bingoCard(double width, List<String> listWithNumbers) {
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
              itemCount: listWithLetters(listWithNumbers).length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: (width*0.072/2),
                  mainAxisSpacing: width*0.072/2
              ),
              itemBuilder: (context, index){
                return _letterOrNumber(context,index,width,listWithLetters(listWithNumbers)[index]);
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
          color: button._colorBackground,
        ),
        child: Center(
          child: Text(button.valorView, style: TextStyle(color: button._colorText,fontWeight: FontWeight.bold, fontSize: width*0.036),),
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
          color: button._colorBackground,
        ),
        child: Center(
          child: Text(button.valorView,
            style: TextStyle(color: button._colorText,fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }
}