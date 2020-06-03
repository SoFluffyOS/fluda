import 'package:fluda/fluda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FludaExample());
}

class FludaExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluda Demo',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              fludaDescription,
              style: context.textTheme.bodyText1,
            ).padHorizontal(),
            Text("Show Dialog").tappable(onTap: () {
              context.showAlertDialog(
                message: "This is a dummy message",
              );
            }).center(),
          ],
        ),
      ),
    );
  }
}

const fludaDescription =
    "Fluda is a library which makes Flutter application development faster and easier. It makes your code clean and easy to read.";
