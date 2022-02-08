import 'package:flutter/material.dart';

/// TODO: Add documentation for this component
class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    this.backgroundColor = Colors.black,
    required this.onPressed,
    required this.child,
    this.radius = 20.0,
  }) : super(key: key);

  final Color? backgroundColor;
  final double radius;
  final Widget child;
  final VoidCallback onPressed;

  /// Returns the real radius calc
  double get _realRadius => radius * 2;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircularClipper(_realRadius),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: _realRadius,
            height: _realRadius,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A CustomClipper that ensures to make circular the [Rect] and centring the
/// content based on an offset.
@visibleForTesting
class CircularClipper extends CustomClipper<Rect> {
  const CircularClipper(this.radius);

  final double radius;

  @override
  Rect getClip(Size size) {
    final aspectRatio = size.aspectRatio * 10;
    double xOffset = 0;
    double yOffset = 0;

    if (size.width > size.height) {
      xOffset = size.width / aspectRatio;
    } else if (size.width < size.height) {
      yOffset = size.height / aspectRatio;
    }

    return Offset(xOffset, yOffset) & Size(radius, radius);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
