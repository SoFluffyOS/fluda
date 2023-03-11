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

class RegexUtils {
  static const String email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String name = r'^[^\W\d_]+(?:[- ][^\W\d_]+)*[.-]?$';

  /// begin with one letter, contains only alphanumeric
  /// and only one dot or underscore in a row (not accept at the end)
  static const String username = r'^[a-zA-Z](?:[_.]?[a-zA-Z0-9]+)*$';

  /// contains only alphanumeric
  /// with selected special character & length from 6-25
  static const String password = r'^[a-zA-Z0-9.\-_!@#$%]{6,25}$';

  static bool check(String text, String pattern) {
    return RegExp(pattern).hasMatch(text);
  }
}
