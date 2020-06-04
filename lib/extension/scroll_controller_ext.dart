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
import 'package:flutter/widgets.dart';

/// Animates the position from its current value to the given value.
///
/// Any active animation is canceled. If the user is currently scrolling, that
/// action is canceled.
///
/// The animation lasts for the 200 ms and follows the [Curves.easeOut].
///
/// The returned [Future] will complete when the animation ends, whether it
/// completed successfully or whether it was interrupted prematurely.
extension ScrollControllerExtension on ScrollController {
  Future<void> goTo(double offset) {
    return this.animateTo(
      offset,
      duration: FludaDuration.ms2,
      curve: Curves.easeOut,
    );
  }
}
