import 'package:flutter/material.dart';

class NegativeActionButton extends StatelessWidget {
  final VoidCallback? negativeAction;
  final String negativeActionTitle;

  const NegativeActionButton(
      {required this.negativeActionTitle, this.negativeAction, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
          if (negativeAction != null) {
            negativeAction!();
          }
        },
        child: FittedBox(
          child: Text(
            negativeActionTitle,
          ),
        ),
      ),
    );
  }
}
