import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SIButton extends StatelessWidget {
  SIButton._({super.key, required this.builder});

  final Widget Function(BuildContext context, bool isLoading) builder;

  factory SIButton.primary({Key? key, required String text, VoidCallback? onPressed}) {
    Widget title(String text) => Text(
      text,
      style: SITextStyles.semibold.copyWith(fontSize: 14, color: SIColors.backgroundWhite),
    );
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SIButton._(
      key: key,
      builder: (context, isLoading) => FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading ? loading() : title(text),
      ),
    );
  }

  factory SIButton.secondary({Key? key, required String text, VoidCallback? onPressed}) {
    Widget title(String text) =>
        Text(text, style: SITextStyles.semibold.copyWith(fontSize: 14, color: SIColors.secondary));
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SIButton._(
      key: key,
      builder: (context, isLoading) => OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(side: BorderSide(color: SIColors.secondary, width: 2)),
        child: isLoading ? loading() : title(text),
      ),
    );
  }

  factory SIButton.text({Key? key, required String text, VoidCallback? onPressed}) {
    Widget title(String text) => Text(text, style: SITextStyles.semibold.copyWith(fontSize: 14));
    Widget loading() => const SizedBox(width: 16, height: 16, child: CircularProgressIndicator());
    return SIButton._(
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
