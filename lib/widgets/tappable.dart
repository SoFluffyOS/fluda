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

import 'package:flutter/material.dart';

const _animationDuration = 75;

class Tappable extends StatefulWidget {
  final Widget child;

  final GestureTapCallback onTap;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;

  const Tappable({
    Key key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
  }) : super(key: key);

  @override
  _TappableState createState() => _TappableState();
}

class _TappableState extends State<Tappable> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _animationDuration),
    );
    animation = Tween(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Transform.scale(
            scale: animation.value,
            child: Container(
              color: Colors.transparent,
              child: widget.child,
            ),
          );
        },
      ),
      onTap: () async {
        if (widget.onTap == null) {
          return;
        }
        widget.onTap();
        await animationController.forward();
        animationController.reverse();
      },
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onTapDown: (TapDownDetails details) {
        if (widget.onTap == null) {
          return;
        }
        animationController.forward();
        if (widget.onTapDown != null) {
          widget.onTapDown(details);
        }
      },
      onTapUp: (TapUpDetails details) {
        if (widget.onTap == null) {
          return;
        }
        animationController.reverse();
      },
      onTapCancel: () {
        if (widget.onTap == null) {
          return;
        }
        animationController.reverse();
        if (widget.onTapCancel != null) {
          widget.onTapCancel();
        }
      },
    );
  }
}
