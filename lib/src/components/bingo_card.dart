import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  //LISTA CON NUMEROS
  List<Map<String,bool>> listwithBingo=[];
  //METODO PARA LLENAR LA LISTA CON BINGO
  List<Map<String,bool>> listWithLetters(List<String> list){
    int i=0;
    int posicion=0;
    while(i<40){
      if(i==0){
        var aux={'B' : false};
        listwithBingo.add(aux);
        i++;
      }
      else if(i==8){
        var aux={'I' : false};
        listwithBingo.add(aux);
        i++;
      }
      else if(i==16){
        var aux={'N' : false};
        listwithBingo.add(aux);
        i++;
      }
      else if(i==24){
        var aux={'G' : false};
        listwithBingo.add(aux);
        i++;
      }
      else if(i==32){
        var aux={'O' : false};
        listwithBingo.add(aux);
        i++;
      }
      else{
        var aux={list[posicion] : false};
        listwithBingo.add(aux);
        i++;
        posicion++;
      }
    }
    return listwithBingo;
  }
  //METODO PARA ACTUALIZAR
  void updateState(Map<String,bool> map){
    var key=map.keys.firstWhere((k) => map[k]==false || true);
    var aux=map[key];
    if(aux==true){
      map.update(key, (value) => false);
    }
    else{
      map.update(key, (value) => true);
    }
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
              itemCount: listWithLetters(listaDeNumeros).length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: (_width*0.072/2),
                  mainAxisSpacing: _width*0.072/2
              ),
              itemBuilder: (context, index){
                return _LetterOrNumber(context,index,_width,listWithLetters(listaDeNumeros)[index]);
              },
            ),
          ),
        ));
  }

  Widget _LetterOrNumber(context, index,double _width, Map<String,bool> map){
    if(index==0 || index==8 || index==16 || index==24 || index==32){
      return _cardLetter(context, index,_width,map);
    }
    else {
      return _buttonNumber(context, index,_width,map);
    }
  }

  Widget _cardLetter(context, index, double _width, Map<String,bool> map/*, Color colorBackground, Color colorText*/) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        child: Center(
          child: Text(map.keys.firstWhere((k) => map[k]==false || true), style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index, double _width, Map<String,bool> map/*,Color colorBackground, Color colorText*/){
    Color colorBacBackground=Colors.pink;
    return InkWell(
      onTap: (){
        setState(() {
          updateState(map);
          var key=map.keys.firstWhere((k) => map[k]==false || true);
          var aux=map[key];
          colorBacBackground=aux==false?Colors.pink:colorBacBackground=Colors.indigo;
        });
      },
      child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorBacBackground,
        ),
        child: Center(
          child: Text(map.keys.firstWhere((k) => map[k]==false || true),
            style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }
}