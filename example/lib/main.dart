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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          fludaDescription,
          style: context.textTheme.bodyText1,
        ).padHorizontal().marginTop(),
        TextFormField(
          controller: TextEditingController(
            text: "simon@simonit.dev",
          ),
          validator: (text) {
            return text
                .validateEmail()
                .ifTrue("", "Not a valid email address!");
          },
          autovalidate: true,
        ).padHorizontal().marginTop(),
        Container(
          color: context.theme.primaryColor,
          child: Text(
            "Show Dialog",
            style: context.textTheme.button.copyWith(color: Colors.white),
          ).spaceAround(2),
        ).roundedBorder().center().tappable(onTap: () {
          context.showAlertDialog(
            message: "This is a dummy message",
          );
        }).marginTop(),
        Row(
          children: <Widget>[
            Container(
              color: context.theme.primaryColor,
              child: Text(
                "Hide keyboard",
                style: context.textTheme.button.copyWith(color: Colors.white),
              ).spaceAround(1.5).center(),
            ).roundedBorder(FludaX.x4).tappable(onTap: () {
              context.hideKeyboard();
            }).expand(),
          ],
        ).padHorizontal().marginTop(),
      ],
    );
  }
}

const fludaDescription =
    "Fluda is a library which makes Flutter application development faster and easier. It makes your code clean and easy to read.";
