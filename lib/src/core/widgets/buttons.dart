import 'package:flutter/material.dart';

class SiButton extends StatelessWidget {
  const SiButton._({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  factory SiButton.primary({
    required VoidCallback? onPressed,
    required String text,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('primary_button'),
    child: FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      child: Text(text),
    ),
  );

  factory SiButton.secondary({
    required VoidCallback? onPressed,
    required String text,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('secondary_button'),
    child: FilledButton.tonal(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      child: Text(text),
    ),
  );

  factory SiButton.outlined({
    required VoidCallback? onPressed,
    required String text,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('outlined_button'),
    child: OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      child: Text(text),
    ),
  );

  factory SiButton.text({
    required VoidCallback? onPressed,
    required String text,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('text_button'),
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      child: Text(text),
    ),
  );
}
