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
    Widget? icon,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('primary_button'),
    child: FilledButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      label: Text(text),
      icon: icon,
      iconAlignment: IconAlignment.start,
    ),
  );

  factory SiButton.secondary({
    required VoidCallback? onPressed,
    required String text,
    Widget? icon,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('secondary_button'),
    child: FilledButton.tonalIcon(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      label: Text(text),
      icon: icon,
      iconAlignment: IconAlignment.start,
    ),
  );

  factory SiButton.outlined({
    required VoidCallback? onPressed,
    required String text,
    Widget? icon,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('outlined_button'),
    child: OutlinedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      label: Text(text),
      icon: icon,
      iconAlignment: IconAlignment.start,
    ),
  );

  factory SiButton.text({
    required VoidCallback? onPressed,
    required String text,
    Widget? icon,
    Size size = const Size.fromHeight(48),
  }) => SiButton._(
    key: Key('text_button'),
    child: TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(size)),
      label: Text(text),
      icon: icon,
      iconAlignment: IconAlignment.start,
    ),
  );
}
