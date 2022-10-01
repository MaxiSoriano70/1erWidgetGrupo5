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
    return _bingoCard(MediaQuery.of(context).size.width);
  }

  Widget _bingoCard(double _width) {
    List<String> listaDeNumeros=["1","2","3","4","5","6","7",
      "9","10","11","12","13","14","15",
      "1","2","3","4","5","6","7",
      "1","2","3","4","5","6","7",
      "1","2","3","4","5","6","7",];

    List<String> listWithLetters(List<String> list){
      List<String> listwithBingo=[];
      int i=0;
      int posicion=0;
      while(i<40){
        if(i==0){
          listwithBingo.add("B");
          i++;
        }
        else if(i==8){
          listwithBingo.add("I");
          i++;
        }
        else if(i==16){
          listwithBingo.add("N");
          i++;
        }
        else if(i==24){
          listwithBingo.add("G");
          i++;
        }
        else if(i==32){
          listwithBingo.add("O");
          i++;
        }
        else{
          listwithBingo.add(list[posicion]);
          i++;
          posicion++;
        }
      }
      return listwithBingo;
    }
    List<String> listwithBingo=[];
    listwithBingo=listWithLetters(listaDeNumeros);

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
              itemCount: listwithBingo.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: (_width*0.072/2),
                mainAxisSpacing: _width*0.072/2
              ),
              itemBuilder: (context, index){
                return _LetterOrNumber(context,index,_width,listwithBingo[index]);
              },
            ),
          ),
        ));
  }

  Widget _LetterOrNumber(context, index,double _width, String text){
    if(index==0 || index==8 || index==16 || index==24 || index==32){
      return _cardLetter(context, index,_width,text);
    }
    else {
      return _buttonNumber(context, index,_width,text);
    }
  }

  Widget _cardLetter(context, index, double _width, String letter/*, Color colorBackground, Color colorText*/) {
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
          child: Text(letter, style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }

  Widget _buttonNumber(context, index, double _width, String number/*,Color colorBackground, Color colorText*/){
    bool hasBeenPressed= false;
    return InkWell(
      onTap: () =>
        setState(()=>
          hasBeenPressed = !hasBeenPressed
        ),
        child: Container(
        width: _width*0.072,
        height: _width*0.072,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: hasBeenPressed? Colors.pink: Colors.black,
        ),
        child: Center(
          child: Text(number,
            style: TextStyle(color: Colors.white, fontSize: _width*0.036),),
        ),
      ),
    );
  }
}