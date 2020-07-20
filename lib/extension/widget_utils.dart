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
import 'package:fluda/widgets/tappable.dart';
import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget roundedBorder([double radius = FludaX.x]) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  Widget marginTop([num factor = 2]) {
    return Container(
      margin: EdgeInsets.only(top: FludaX.x * factor),
      child: this,
    );
  }

  Widget marginLeft([num factor = 1]) {
    return Container(
      margin: EdgeInsets.only(left: FludaX.x * factor),
      child: this,
    );
  }

  Widget marginRight([num factor = 1]) {
    return Container(
      margin: EdgeInsets.only(right: FludaX.x * factor),
      child: this,
    );
  }

  Widget marginBottom([num factor = 2]) {
    return Container(
      margin: EdgeInsets.only(bottom: FludaX.x * factor),
      child: this,
    );
  }

  Widget padVertical([num factor = 1]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: FludaX.x * factor),
      child: this,
    );
  }

  Widget padHorizontal([num factor = 3]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FludaX.x * factor),
      child: this,
    );
  }

  Widget spaceAround([num factor = 1]) {
    return Container(
      margin: EdgeInsets.all(FludaX.x * factor),
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expand([flex = 1]) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget flex([flex = 1, fit = FlexFit.loose]) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  Widget wrapHero(String tag) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        return Material(
          child: toHeroContext.widget,
        );
      },
      child: this,
    );
  }

  Widget tappable({
    GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
  }) {
    return Tappable(
      child: this,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
    );
  }
}
