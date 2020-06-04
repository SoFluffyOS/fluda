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

/// Animates the controlled [PageView] from the current page to the given page.
///
/// The animation lasts for the 200 ms and follows the [Curves.easeOut].
/// The returned [Future] resolves when the animation completes.
extension PageControllerExt on PageController {
  Future<void> goTo(int page) {
    return this.animateToPage(
      page,
      duration: FludaDuration.ms2,
      curve: Curves.easeOut,
    );
  }
}
