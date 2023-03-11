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

extension NumExt on num {
  /// Returns `true` if the number [this] is even
  bool get isEven => this % 2 == 0;

  /// Returns `true` if the number [this] is odd
  bool get isOdd => this % 2 != 0;

  /// Returns `true` if the number [this] is a positive number
  bool get isPositive => this > 0;

  /// Returns `true` if the number [this] is a negative number
  bool get isNegative => this < 0;
}

extension IntExt on int {
  /// Return an [Iterable] which generates its elements dynamically
  /// begin from [this] number to [end] number
  Iterable<int> to(int end, {int step = 1}) {
    if (step < 1) {
      throw ArgumentError(
          'Invalid step size: $step. Step size must be greater than 0');
    }
    final count = ((end - this).abs() / step).ceil();
    // Explicit type declaration required for function argument.
    final int Function(int) generator = this >= end
        ? (index) => this - (step * index)
        : (index) => this + (step * index);
    return Iterable<int>.generate(count, generator);
  }
}
