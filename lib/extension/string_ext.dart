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
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url;

extension StringExt on String {
  /// Return `true` if the string [this] is `null` or empty
  bool get isEmptyOrNull => this == null || isEmpty;

  /// Parse `this` string as a, possibly signed, integer literal
  /// and return its value.
  int toInt() {
    return int.parse(this);
  }

  /// Parse `this` string as an double literal and return its value.
  double toDouble() {
    return double.parse(this);
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
  bool validate(Pattern pattern) {
    return RegexUtils.check(this, pattern);
  }

  /// Returns whether `this` string is a valid email address
  bool validateEmail() {
    return RegexUtils.check(this, RegexUtils.email);
  }

  /// Parses the specified URL string and delegates handling of it to the
  /// underlying platform.
  ///
  /// [forceSafariVC] is only used in iOS with iOS version >= 9.0. By default (when unset), the launcher
  /// opens web URLs in the Safari View Controller, anything else is opened
  /// using the default handler on the platform. If set to true, it opens the
  /// URL in the Safari View Controller. If false, the URL is opened in the
  /// default browser of the phone. Note that to work with universal links on iOS,
  /// this must be set to false to let the platform's system handle the URL.
  /// Set this to false if you want to use the cookies/context of the main browser
  /// of the app (such as SSO flows). This setting will nullify [universalLinksOnly]
  /// and will always launch a web content in the built-in Safari View Controller regardless
  /// if the url is a universal link or not.
  ///
  /// [universalLinksOnly] is only used in iOS with iOS version >= 10.0. This setting is only validated
  /// when [forceSafariVC] is set to false. The default value of this setting is false.
  /// By default (when unset), the launcher will either launch the url in a browser (when the
  /// url is not a universal link), or launch the respective native app content (when
  /// the url is a universal link). When set to true, the launcher will only launch
  /// the content if the url is a universal link and the respective app for the universal
  /// link is installed on the user's device; otherwise throw a [PlatformException].
  ///
  /// [forceWebView] is an Android only setting. If null or false, the URL is
  /// always launched with the default browser on device. If set to true, the URL
  /// is launched in a WebView. Unlike iOS, browser context is shared across
  /// WebViews.
  /// [enableJavaScript] is an Android only setting. If true, WebView enable
  /// javascript.
  /// [enableDomStorage] is an Android only setting. If true, WebView enable
  /// DOM storage.
  /// [headers] is an Android only setting that adds headers to the WebView.
  ///
  /// Note that if any of the above are set to true but the URL is not a web URL,
  /// this will throw a [PlatformException].
  ///
  /// [statusBarBrightness] Sets the status bar brightness of the application
  /// after opening a link on iOS. Does nothing if no value is passed. This does
  /// not handle resetting the previous status bar style.
  ///
  /// Returns `true` if launch url is successful; `false` is returned if
  /// the URLs is invalid or the schemes cannot be handled
  /// Also return `false` when [universalLinksOnly] is set to true and
  /// the universal link failed to launch
  Future<bool> launch({
    bool forceSafariVC,
    bool forceWebView,
    bool enableJavaScript,
    bool enableDomStorage,
    bool universalLinksOnly,
    Map<String, String> headers,
    Brightness statusBarBrightness,
  }) async {
    if (await url.canLaunch(this)) {
      return url.launch(
        this,
        forceSafariVC: forceSafariVC,
        forceWebView: forceWebView,
        enableJavaScript: enableJavaScript,
        enableDomStorage: enableDomStorage,
        universalLinksOnly: universalLinksOnly,
        headers: headers,
      );
    }
    return false;
  }
}
