/*
 * Copyright 2020 Simon Pham. All rights reserved.
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import 'package:fluda/constants/numbers.dart';
import 'package:flutter/material.dart';

import 'bool_ext.dart';

extension BuildContextExt on BuildContext {
  /// Hide the soft keyboard off the screen.
  ///
  /// Deprecated. Will be removed in the next version.
  /// Should use [context.focus.hideKeyboard()] instead.
  @deprecated
  void hideKeyboard() {
    if (!this.focus.hasPrimaryFocus) {
      this.focus.unfocus();
    }
  }

  /// Contains information about the current media.
  ///
  /// For example, the [MediaQueryData.size] property contains the width and
  /// height of the current window.
  MediaQueryData get query {
    return MediaQuery.of(this);
  }

  /// Returns the [FocusScopeNode] of the [FocusScope] that most tightly
  /// encloses the given [context].
  FocusScopeNode get focus {
    return FocusScope.of(this);
  }

  /// The data from the closest [Theme] instance that encloses the given
  /// context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// return Text(
  ///   "Hello World!",
  ///   style: context.theme.textTheme.headline6,
  /// );
  /// ```
  ThemeData get theme {
    return Theme.of(this);
  }

  /// Text with a color that contrasts with the card and canvas colors.
  ///
  /// [Deprecated]. Will be removed in the next version.
  /// There are other text theme such as [context.theme.primaryTextTheme] or
  /// [context.theme.accentTextTheme] that are also useful.
  /// Should call [context.theme.textTheme] instead.
  @deprecated
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  /// The state from the closest instance of this class that encloses the given
  /// context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// context.navigator
  ///   ..pop()
  ///   ..pop()
  ///   ..pushNamed('/settings');
  /// ```
  ///
  /// If `rootNavigator` is set to true, the state from the furthest instance of
  /// this class is given instead. Useful for pushing contents above all subsequent
  /// instances of [Navigator].
  NavigatorState get navigator {
    return Navigator.of(this);
  }

  /// Pop the top-most route off the navigator.
  ///
  /// [Deprecated]. Will be removed in the next version.
  /// Should call [BuildContext.navigator.pop()] instead.
  @deprecated
  T pop<T>([T result]) {
    Navigator.of(this).pop(result);
    return result;
  }

  /// Show a simple dialog with title, message and a close button.
  ///
  /// Example usage:
  /// ```dart
  /// void _showUploadSuccessDialog(BuildContext context) {
  ///   context.showDialog(
  ///     message: "Uploaded successful!",
  ///   );
  /// }
  /// ```
  Future showAlertDialog({
    String title,
    @required String message,
    closeButtonTitle = "OK",
  }) {
    return showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FludaX.x3),
          ),
          title: (title != null).ifTrue(
            Text(
              title ?? "",
              style: context.textTheme.headline5,
            ),
          ),
          content: Text(
            message ?? "",
            style: context.textTheme.headline6,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                closeButtonTitle,
                style: context.textTheme.button,
              ),
              onPressed: () => this.pop(),
            ),
          ],
        );
      },
    );
  }
}
