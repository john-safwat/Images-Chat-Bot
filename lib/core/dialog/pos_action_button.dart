import 'package:flutter/material.dart';

class PosActionButton extends StatelessWidget {
  final VoidCallback? posAction;
  final String posActionTitle;

  const PosActionButton(
      {required this.posActionTitle, this.posAction, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () {
          Navigator.pop(context);
          if (posAction != null) {
            posAction!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(child: Text(posActionTitle)),
        ),
      ),
    );
  }
}
