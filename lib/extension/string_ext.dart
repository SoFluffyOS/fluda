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

import 'package:fluda/utils/string_utils.dart';

extension StringExt on String? {
  /// Return `true` if the string [this] is `null` or empty
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  /// Return `true` if the string [this] is not `null` or empty
  bool get isNotEmptyOrNull => this?.isNotEmpty ?? false;

  /// Parse `this` string as a, possibly signed, integer literal
  /// and return its value.
  int? toInt({int? defaultValue}) {
    final String? _copy = this;
    if (_copy == null) {
      return defaultValue;
    }
    return int.tryParse(_copy) ?? defaultValue;
  }

  /// Parse `this` string as an double literal and return its value.
  double? toDouble({double? defaultValue}) {
    final String? _copy = this;
    if (_copy == null) {
      return defaultValue;
    }
    return double.tryParse(_copy) ?? defaultValue;
  }

  /// Returns whether the regular expression `pattern`
  /// has a match in `this` string.
  ///
  /// For some pre-defined regular expressions, check out [RegexUtils]
  ///
  /// Example usage
  /// ```dart
  /// final String greetings = "Hello World";
  ///
  /// if (greetings.validate(RegexUtils.name)) {
  ///   return "Hello Mr $greetings";
  /// } else {
  ///   return "$greetings is not a name";
  /// }
  /// ```
  bool validate(String pattern) {
    final String? _copy = this;
    if (_copy == null) {
      return false;
    }
    return RegexUtils.check(_copy, pattern);
  }

  /// Returns whether `this` string is a valid email address
  bool validateEmail() {
    final String? _copy = this;
    if (_copy == null) {
      return false;
    }
    return RegexUtils.check(_copy, RegexUtils.email);
  }
}
