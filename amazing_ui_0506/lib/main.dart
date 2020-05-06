import 'package:amazing_ui_0506/data.dart';
import 'package:amazing_ui_0506/widgets/cardSection.dart';
import 'package:amazing_ui_0506/widgets/expenses.dart';
import 'package:amazing_ui_0506/widgets/header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular'),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: WalletHeader(),
          ),
          Expanded(child: CardSection()),
          Expanded(child: ExpenseSection())
        ],
      ),
    );
  }
}
