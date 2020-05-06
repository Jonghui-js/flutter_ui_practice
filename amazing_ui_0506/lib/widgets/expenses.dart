import 'package:amazing_ui_0506/data.dart';
import 'package:amazing_ui_0506/widgets/piechart.dart';
import 'package:flutter/material.dart';

class ExpenseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Expenses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: expenses
                          .map((value) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor:
                                          pieColors[expenses.indexOf(value)],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      value['name'],
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                )),
            Expanded(
              flex: 6,
              child: PieChart(),
            )
          ],
        ),
      ],
    );
  }
}
