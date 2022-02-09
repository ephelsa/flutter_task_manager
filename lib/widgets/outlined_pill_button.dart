import 'package:flutter/material.dart';

/// TODO
class OutlinedPillButton extends StatelessWidget {
  const OutlinedPillButton({
    Key? key,
    required this.borderColor,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final Color borderColor;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.transparent,
            border: Border.all(color: borderColor.withAlpha(70)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 12.0,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
