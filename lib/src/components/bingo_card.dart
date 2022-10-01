import 'package:flutter/foundation.dart';
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

  Widget _bingoCard() {
    List<String> listaDeNumeros=["1","2","3","4","5","6","7",
      "9","10","11","12","13","14","15",
      "1","2","3","4","5","6","7",
      "1","2","3","4","5","6","7",
      "1","2","3","4","5","6","7",];

    List<String> listaConLetras(List<String> list){
      List<String> listaConBingo=[];
      int i=0;
      int posicion=0;
      while(i<40){
        if(i==0){
          listaConBingo.add("B");
          i++;
        }
        else if(i==8){
          listaConBingo.add("I");
          i++;
        }
        else if(i==16){
          listaConBingo.add("N");
          i++;
        }
        else if(i==24){
          listaConBingo.add("G");
          i++;
        }
        else if(i==32){
          listaConBingo.add("O");
          i++;
        }
        else{
          listaConBingo.add(list[posicion]);
          i++;
          posicion++;
        }
      }
      return listaConBingo;
    }
    List<String> listaConBingo=[];
    listaConBingo=listaConLetras(listaDeNumeros);

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
          child: GridView.builder(
              itemCount: listaConBingo.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
              ),
              itemBuilder: (context, index){
                return _LetterOrNumber(context,index);
            },
        ),
      ),
    ));
  }

  Widget _LetterOrNumber(context, index){
    if(index==0 || index==8 || index==16 || index==24 || index==32){
      return _cardLetter(context, index);
    }
    else {
      return _buttonNumber(context, index);
    }
  }

  Widget _cardLetter(context, index/*String letter, Color colorBackground, Color colorText*/) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: Center(
          child: Text(context[index], style: const TextStyle(color: Colors.white, fontSize: 15),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index/*String number,Color colorBackground, Color colorText*/){
    Color colorBacBackground=Colors.pink;
    bool checkColor=true;
    return InkWell(
      onTap: (){
        setState(() {
          checkColor=!checkColor;
          colorBacBackground=checkColor==true?Colors.pink:colorBacBackground=Colors.indigo;
        });
      },
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorBacBackground,
        ),
        child: Center(
          child: Text(context[index], style: const TextStyle(color: Colors.white, fontSize: 15),),
        ),
      ),
    );
  }
}