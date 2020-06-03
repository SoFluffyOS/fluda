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
  void hideKeyboard() {
    if (!this.focus.hasPrimaryFocus) {
      this.focus.unfocus();
    }
  }

  MediaQueryData get query {
    return MediaQuery.of(this);
  }

  FocusScopeNode get focus {
    return FocusScope.of(this);
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  T pop<T>([T result]) {
    Navigator.of(this).pop(result);
    return result;
  }

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
