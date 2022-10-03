import 'package:flutter/material.dart';

class CustomButton{
  String? _valorView;
  bool? _check;
  Color? _colorBacBackground;
  Color? _colorText;

  CustomButton(String valorView, Color colorBacBackground, Color colorText){
    _valorView=valorView;
    _check=false;
    _colorBacBackground=colorBacBackground;
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

  Color get colorBacBackground => _colorBacBackground!;

  set colorBacBackground(Color value) {
    _colorBacBackground = value;
  }

  void _bingoCheck(){
    if(_check==false){
      _check=true;
      _colorBacBackground=const Color(0xffa4243b);
      _colorText=Colors.black;
    }
    else{
      _check=false;
      _colorBacBackground=const Color(0xffada9a6);
      _colorText=Colors.white;
    }
  }

}

class BingoCard extends StatefulWidget {
  const BingoCard({Key? key}) : super(key: key);

  @override
  State<BingoCard> createState() => _BingoCardState();
}

class _BingoCardState extends State<BingoCard> {
  //LISTA DE NUMEROS
  List<String> listaDeNumeros=["1","2","3","4","5","6","7",
    "9","10","11","12","13","14","15",
    "1","2","3","4","5","6","7",
    "1","2","3","4","5","6","7",
    "1","2","3","4","5","6","7",];
  //LISTA DE NUMERO CON BINGO
  List<CustomButton> listaConBingo=[];
  //METODO PARA AGREGAR BINGO
  List<CustomButton> listaConLetras(List<String> list){
    int i=0;
    int posicion=0;
    while(i<40){
      if(i==0){
        var aux=CustomButton("B",const Color(0xff09857d),Colors.white);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==8){
        var aux=CustomButton("I",const Color(0xff09857d),Colors.white);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==16){
        var aux=CustomButton("N",const Color(0xff09857d),Colors.white);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==24){
        var aux=CustomButton("G",const Color(0xff09857d),Colors.white);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==32){
        var aux=CustomButton("O",const Color(0xff09857d),Colors.white);
        listaConBingo.add(aux);
        i++;
      }
      else{
        var aux=CustomButton(list[posicion],const Color(0xffada9a6),Colors.black);
        listaConBingo.add(aux);
        i++;
        posicion++;
      }
    }
    return listaConBingo;
  }

  void _checkColorButton(CustomButton button){
    button._bingoCheck();
  }

  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width);
  }

  Widget _bingoCard(double width) {
    return Material(
        elevation: 25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: width,
            height: width*0.64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(width*0.072/2),
              itemCount: listaConLetras(listaDeNumeros).length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: (width*0.072/2),
                  mainAxisSpacing: width*0.072/2
              ),
              itemBuilder: (context, index){
                return _letterOrNumber(context,index,width,listaConLetras(listaDeNumeros)[index]);
              },
            ),
          ),
        ));
  }

  Widget _letterOrNumber(context, index,double width, CustomButton button){
    if(index==0 || index==8 || index==16 || index==24 || index==32){
      return _cardLetter(context, index,width, button);
    }
    else {
      return _buttonNumber(context, index,width, button);
    }
  }

  Widget _cardLetter(context, index, double width, CustomButton button/*, Color colorBackground, Color colorText*/) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: width*0.072,
        height: width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: button._colorBacBackground,
        ),
        child: Center(
          child: Text(button.valorView, style: TextStyle(color: button._colorText,fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index, double width, CustomButton button/*,Color colorBackground, Color colorText*/){
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
          borderRadius: BorderRadius.circular(15),
          color: button.colorBacBackground,
        ),
        child: Center(
          child: Text(button.valorView,
            style: TextStyle(color: button._colorText,fontWeight: FontWeight.bold, fontSize: width*0.036),),
        ),
      ),
    );
  }
}