import 'package:flutter/material.dart';

class CustomButton{
  String? _valorView;
  bool? _check;
  Color? _colorBacBackground;

  CustomButton(String s, Color c){
    _valorView=s;
    _check=false;
    _colorBacBackground=c;
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

  void Check(){
    if(_check==false){
      _check=true;
      _colorBacBackground=Colors.indigo;
    }
    else{
      _check=false;
      _colorBacBackground=Colors.pink;
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
        var aux=new CustomButton("B",Colors.green);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==8){
        var aux=new CustomButton("I",Colors.green);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==16){
        var aux=new CustomButton("N",Colors.green);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==24){
        var aux=new CustomButton("G",Colors.green);
        listaConBingo.add(aux);
        i++;
      }
      else if(i==32){
        var aux=new CustomButton("O",Colors.green);
        listaConBingo.add(aux);
        i++;
      }
      else{
        var aux=new CustomButton(list[posicion],Colors.pink);
        listaConBingo.add(aux);
        i++;
        posicion++;
      }
    }
    return listaConBingo;
  }

  void CheckColorButton(CustomButton button){
    button.Check();
  }

  @override
  Widget build(BuildContext context) {
    return _bingoCard(MediaQuery.of(context).size.width);
  }

  Widget _bingoCard(double _width) {
    return Material(
        elevation: 25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: _width,
            height: _width*0.64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: GridView.builder(
              padding: EdgeInsets.all(_width*0.072/2),
              itemCount: listaConLetras(listaDeNumeros).length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: (_width*0.072/2),
                  mainAxisSpacing: _width*0.072/2
              ),
              itemBuilder: (context, index){
                return _LetterOrNumber(context,index,_width,listaConLetras(listaDeNumeros)[index]);
              },
            ),
          ),
        ));
  }

  Widget _LetterOrNumber(context, index,double _width, CustomButton button){
    if(index==0 || index==8 || index==16 || index==24 || index==32){
      return _cardLetter(context, index,_width, button);
    }
    else {
      return _buttonNumber(context, index,_width, button);
    }
  }

  Widget _cardLetter(context, index, double _width, CustomButton button/*, Color colorBackground, Color colorText*/) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: button._colorBacBackground,
        ),
        child: Center(
          child: Text(button.valorView, style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index, double _width, CustomButton button/*,Color colorBackground, Color colorText*/){
    return InkWell(
      onTap: (){
        setState(() {
          CheckColorButton(button);
        });
      },
      child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: button.colorBacBackground,
        ),
        child: Center(
          child: Text(button.valorView,
            style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }
}