import 'package:flutter/material.dart';

/// TODO
class PillButton extends StatelessWidget {
  const PillButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = MaterialStateProperty.all<Color?>(
      isSelected ? Colors.black : Colors.white,
    );
    final textColor = isSelected ? Colors.white : Colors.black;

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.grey[800]),
        backgroundColor: backgroundColor,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button?.copyWith(color: textColor),
      ),
    );
  }
}
