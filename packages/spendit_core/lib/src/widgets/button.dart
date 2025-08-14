import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SiButton extends StatelessWidget {
  SiButton._({super.key, required this.builder});

  final Widget Function(BuildContext context, bool isLoading) builder;

  factory SiButton.primary({Key? key, required String text, required VoidCallback? onPressed}) {
    Widget title(String text) => Text(text, style: SiTextStyles.semibold.copyWith(fontSize: 14));
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SiButton._(
      key: key,
      builder: (context, isLoading) => FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading ? loading() : title(text),
      ),
    );
  }

  factory SiButton.secondary({Key? key, required String text, required VoidCallback? onPressed}) {
    Widget title(String text) => Text(text, style: SiTextStyles.semibold.copyWith(fontSize: 14));
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SiButton._(
      key: key,
      builder: (context, isLoading) => OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(side: BorderSide(color: SiColors.accent, width: 2)),
        child: isLoading ? loading() : title(text),
      ),
    );
  }

  factory SiButton.text({Key? key, required String text, required VoidCallback? onPressed}) {
    Widget title(String text) => Text(text, style: SiTextStyles.semibold.copyWith(fontSize: 14));
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SiButton._(
      key: key,
      builder: (context, isLoading) => TextButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading ? loading() : title(text),
      ),
    );
  }

  final loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loading,
      builder: (context, value, child) => builder(context, value),
    );
  }
}
