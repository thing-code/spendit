import 'package:flutter/material.dart';

class SIButton extends StatelessWidget {
  const SIButton._({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  factory SIButton.primary({Key? key, required String text, required VoidCallback onPressed}) {
    return SIButton._(
      key: key,
      builder: (context) => FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }

  factory SIButton.secondary({Key? key, required String text, required VoidCallback onPressed}) {
    return SIButton._(
      key: key,
      builder: (context) => OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }

  factory SIButton.text({Key? key, required String text, required VoidCallback onPressed}) {
    return SIButton._(
      key: key,
      builder: (context) => TextButton(onPressed: onPressed, child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
