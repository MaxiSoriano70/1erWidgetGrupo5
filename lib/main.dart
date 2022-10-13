import 'package:desafiogrupal/src/components/bingo_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: BingoCard(
        numbersList: [
          1,2,3,4,5,6,7,
          8,9,10,11,12,13,14,
          15,16,17,18,19,20,21],) ,),
    );
  }
}