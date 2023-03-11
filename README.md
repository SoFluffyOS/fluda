# Fluda

Fluda is a library which makes Flutter application development faster and easier. It makes your code clean and easy to read.

*Note*: Fluda is still under development.
[Feedback](https://github.com/simonpham/fluda/issues) and [Pull Requests](https://github.com/simonpham/fluda/pulls) are most welcome!

## Usage

### Extensions

#### BuildContext

| Extension                      | Example Usage       | Original Equivalent      |
|--------------------------------|---------------------|--------------------------|
| `MediaQueryData get query`     | `context.query`     | `MediaQuery.of(context)` |
| `FocusScopeNode get focus`     | `context.focus`     | `FocusScope.of(context)` |
| `ThemeData get theme`          | `context.theme`     | `Theme.of(context)`      |
| `NavigatorState get navigator` | `context.navigator` | `Navigator.of(context)`  |

#### FocusScopedNode

| Extension        | Example Usage                  | Original Equivalent                                                             |
|------------------|--------------------------------|---------------------------------------------------------------------------------|
| `hideKeyboard()` | `context.focus.hideKeyboard()` | `if (!FocusScope.of(context).hasPrimaryFocus) FocusScope.of(context).unfocus()` |

#### Boolean

| Extension           | Example Usage                                    | Original Equivalent                         |
|---------------------|--------------------------------------------------|---------------------------------------------|
| `ifTrue(yes, [no])` | `someBool.ifTrue(Text("Hello"))`                 | `someBool ? Text("Hello") : SizedBox()`     |
|                     | `someBool.ifTrue(firstVariable, secondVariable)` | `someBool ? firstVariable : secondVariable` |

#### Number

| Extension                                   | Example Usage  | Original Equivalent |
|---------------------------------------------|----------------|---------------------|
| `bool get isEven`                           | `5.isEven`     | `(5 % 2 == 0)`      |
| `bool get isOdd`                            | `5.isOdd`      | `(5 % 2 != 0)`      |
| `bool get isPositive`                       | `5.isPositive` | `(5 > 0)`           |
| `bool get isNegative`                       | `5.isNegative` | `(5 < 0)`           |
| `Iterable<int> to(int end, {int step = 1})` | `2.to(5)`      | `[2, 3, 4, 5]`      |

#### String

| Extension                   | Example Usage                            | Original Equivalent                                                                 |
|-----------------------------|------------------------------------------|-------------------------------------------------------------------------------------|
| `bool get isEmptyOrNull`    | `"Hello".isEmptyOrNull`                  | `"Hello" == null ⎮⎮ "Hello".isEmpty`                                                |
| `bool get isNotEmptyOrNull` | `"Hello".isNotEmptyOrNull`               | `"Hello" != null && "Hello".isNotEmpty`                                             |
| `int toInt()`               | `"23".toInt()`                           | `int.parse("23")`                                                                   |
| `double toDouble()`         | `"23.3".toDouble()`                      | `double.parse("23.3")`                                                              |
| `bool validate()`           | `"Simon Pham".validate(RegexUtils.name)` | `RegExp(nameRegex).hasMatch("Simon Pham")`                                          |
| `bool validateEmail()`      | `"email@email.com".validateEmail()`      | `RegExp(emailRegex).hasMatch("email@email.com")`                                    |
| `Future launch()`           | `"https://some.url".launch()`            | `if (await url.canLaunch("https://some.url")) url.launch("https://some.url")`       |
| `Future dial()`             | `"0987654321".dial()`                    | `if (await url.canLaunch("tel:0987654321")) url.launch("tel:0987654321")`           |
| `Future sendMail()`         | `"me@email.com".sendMail()`              | `if (await url.canLaunch("mailto:me@email.com")) url.launch("mailto:me@email.com")` |

#### PageController

| Extension                     | Example Usage            | Description                                 |
|-------------------------------|--------------------------|---------------------------------------------|
| `Future<void> goTo(int page)` | `pageController.goTo(2)` | Animate PageView to page index `2` smoothly |

#### ScrollController

| Extension                            | Example Usage                   | Description                                         |
|--------------------------------------|---------------------------------|-----------------------------------------------------|
| `Future<void> goTo(double position)` | `scrollController.goTo(233.99)` | Animate Scroll widget to position `233.99` smoothly |

#### TextEditingController

| Extension          | Example Usage                       | Description                       |
|--------------------|-------------------------------------|-----------------------------------|
| `void selectAll()` | `textEditingController.selectAll()` | Select all text in the text field |

#### Constants

| Constant      | Value  |
|---------------|--------|
| `FludaX.x0_5` | `4.0`  |
| `FludaX.x`    | `8.0`  |
| `FludaX.x2`   | `16.0` |
| `FludaX.x3`   | `24.0` |
| `FludaX.x4`   | `32.0` |
| `FludaX.x5`   | `40.0` |
| `FludaX.x6`   | `48.0` |
| `FludaX.x7`   | `56.0` |
| `FludaX.x8`   | `64.0` |

| Constant (`Duration`) | Value   |
|-----------------------|---------|
| `FludaDuration.ms`    | `100ms` |
| `FludaDuration.ms2`   | `200ms` |
| `FludaDuration.ms3`   | `300ms` |
| `FludaDuration.ms4`   | `400ms` |
| `FludaDuration.ms5`   | `500ms` |
| `FludaDuration.ms6`   | `600ms` |
| `FludaDuration.ms7`   | `700ms` |
| `FludaDuration.ms8`   | `800ms` |


## Issues

Please file Fluda specific issues, bugs, or feature requests in our [issue tracker](https://github.com/simonpham/fluda/issues/new).

Plugin issues that are not specific to Fluda can be filed in the [Flutter issue tracker](https://github.com/flutter/flutter/issues/new).

## Contributing

If you wish to contribute a change to any of the existing plugins in this repo,
please review our [contribution guide](https://github.com/simonpham/fluda/blob/master/CONTRIBUTING.md),
and send a [pull request](https://github.com/simonpham/fluda/pulls).