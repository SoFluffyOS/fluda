# Fluda Basic Example Usage

*Note*: This documentation hasn't been finished yet. There may be some part of the instruction is missing. Please stay tuned.

### Extensions
#### BuildContext
|Extension|Example Usage|Original Equivalent|
|---|---|---|
|`MediaQueryData get query`|`context.query`|`MediaQuery.of(context)`|
|`FocusScopeNode get focus`|`context.focus`|`FocusScope.of(context)`|
|`ThemeData get theme`|`context.theme`|`Theme.of(context)`|
|`ThemeData get textTheme`|`context.textTheme`|`Theme.of(context).textTheme`|
|`NavigatorState get navigator`|`context.navigator`|`Navigator.of(context)`|
|`T pop<T>([T result])`|`context.pop()`|`Navigator.of(context).pop()`|
|`hideKeyboard()`|`context.hideKeyboard()`|`if (!FocusScope.of(context).hasPrimaryFocus) FocusScope.of(context).unfocus()`|
|`Future showAlertDialog({String title, @required String message, closeButtonTitle = "OK"})`|`context.showDialog(message: "Fluda"`)|[Check out the code](https://github.com/simonpham/fluda/blob/master/lib/extension/build_context_ext.dart)|

#### Boolean
|Extension|Example Usage|Original Equivalent|
|---|---|---|
|`ifTrue(yes, [no])`|`someBool.ifTrue(Text("Hello"))`|`someBool ? Text("Hello") : SizedBox()`|
| |`someBool.ifTrue(firstVariable, secondVariable)`|`someBool ? firstVariable : secondVariable`|

#### Number
|Extension|Example Usage|Original Equivalent|
|---|---|---|
|`bool get isEven`|`5.isEven`|`(5 % 2 == 0)`|
|`bool get isOdd`|`5.isEven`|`(5 % 2 != 0)`|
|`bool get isPositive`|`5.isPositive`|`(5 > 0)`|
|`bool get isNegative`|`5.isNegative`|`(5 < 0)`|
|`Iterable<int> to(int end, {int step = 1})`|`2.to(5)`|`[2, 3, 4, 5]`|

#### String
|Extension|Example Usage|Original Equivalent|
|---|---|---|
|`bool get isEmptyOrNull`|`"Hello".isEmptyOrNull`|`"Hello" == null ⎮⎮ isEmpty`|
|`bool validateEmail()`|`"email@email.com".validateEmail()`|`RegExp(emailRegex).hasMatch("email@email.com")`|
|`Future launch()`|`"https://some.url".launch()`|`if (await url.canLaunch(this)) url.launch(this)`|

#### PageController

|Extension|Example Usage|Description|
|---|---|---|
|`Future<void> goTo(int page)`|`pageController.goTo(2)`|Animate PageView to page index `2` smoothly|

#### ScrollController

|Extension|Example Usage|Description|
|---|---|---|
|`Future<void> goTo(double position)`|`scrollController.goTo(233.99)`|Animate Scroll widget to position `233.99` smoothly|


#### TextEditingController

|Extension|Example Usage|Description|
|---|---|---|
|`void selectAll()`|`textEditingController.selectAll()`|Select all text in the text field|

#### Widget

|Extension|Example Usage|Description|
|---|---|---|
|`// TODO: complete documentation`| | |