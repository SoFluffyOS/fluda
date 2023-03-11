import 'package:fluda/fluda.dart';
import 'package:fluda/widgets/tappable.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: FludaX.x3,
          ),
          child: Column(
            children: <Widget>[
              Text(
                fludaDescription,
                style: context.theme.textTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: FludaX.x2,
                ),
                child: TextFormField(
                  controller: TextEditingController(
                    text: "simon@simonit.dev",
                  ),
                  validator: (text) {
                    final isValid = text.validateEmail();
                    return isValid ? null : "Not a valid email address!";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: FludaX.x2,
                ),
                child: Row(
                  children: <Widget>[
                    Tappable(
                      onTap: () {
                        context.focus.hideKeyboard();
                      },
                      child: Container(
                        color: context.theme.primaryColor,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.theme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(FludaX.x4),
                        ),
                        padding: const EdgeInsets.all(FludaX.x * 1.5),
                        child: Text(
                          "Hide keyboard",
                          style: context.theme.primaryTextTheme.button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const fludaDescription =
    "Fluda is a library which makes Flutter application development faster and easier. It makes your code clean and easy to read.";
