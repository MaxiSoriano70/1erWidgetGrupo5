import 'package:desafiogrupal/src/components/bingo_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Expanded(child: Container(color: Colors.pink,)),
          const BingoCard(),
          Expanded(child: Container(color: Colors.pink,)),
        ],
      ),
    );
  }
}
