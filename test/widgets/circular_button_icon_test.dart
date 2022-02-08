import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/widgets/circular_button_icon.dart';

void main() {
  group('CircularClipper tests', () {
    const CircularClipper clipper = CircularClipper(50.0);

    test(
      'When Size.width and Size.height are equals. Then Offset should be zero',
      () {
        // Given
        const Rect expected = Rect.fromLTWH(0, 0, 50.0, 50.0);
        const Size size = Size(50.0, 50.0);

        // When
        final Rect result = clipper.getClip(size);

        // Then
        expect(result, expected);
      },
    );

    test(
      'When Size.width is greater than Size.height. Then Offset should be increased on X',
      () {
        // Given
        const Rect expected = Rect.fromLTWH(4.0, 0, 50.0, 50.0);
        const Size size = Size(56.0, 40.0);

        // When
        final Rect result = clipper.getClip(size);

        // Then
        expect(result, expected);
      },
    );

    test(
      'When Size.width is less than Size.height. Then Offset should be increased on Y',
      () {
        // Given
        const Rect expected = Rect.fromLTWH(0, 7.84, 50.0, 50.0);
        const Size size = Size(40.0, 56.0);

        // When
        final Rect result = clipper.getClip(size);

        // Then
        expect(result, expected);
      },
    );
  });
}
