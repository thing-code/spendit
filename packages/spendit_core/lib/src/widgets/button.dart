import 'package:flutter/material.dart';

class SpendItButton extends StatelessWidget {
  const SpendItButton._({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  factory SpendItButton.primary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SpendItButton._(
      key: key,
      builder:
          (context) => FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }

  factory SpendItButton.secondary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SpendItButton._(
      key: key,
      builder:
          (context) => OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }

  factory SpendItButton.text({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SpendItButton._(
      key: key,
      builder: (context) => TextButton(onPressed: onPressed, child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
