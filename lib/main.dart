import 'package:desafiogrupal/src/components/bingo_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
  final List<String> listWithfakeNumbers=["1"," 2","3","4","5","6","7",
    "9","10","11","12","13","14","15",
    "1","2","3","4","5","6","7",
    "1","2","3","4","5","6","7",
    "1","2","3","4","5","6","7",];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
          children: [
            Expanded(child: Container(color: Colors.pink,)),
            BingoCard(
                listWithNumbers: listWithfakeNumbers,
            colorBingo: const Color(0xff09857d),
            colorCard: Colors.white60,
            colorNumber: const Color(0xffada9a6),
            colorNumberPressed: const Color(0xff09857d),),
            Expanded(child: Container(color: Colors.white24,)),

          ],
        )
    );
  }
}
