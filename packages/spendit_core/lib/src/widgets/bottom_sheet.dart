import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SiBottomSheet<T> extends StatelessWidget {
  const SiBottomSheet({super.key, this.title, required this.close, required this.builder});

  final String? title;
  final ValueChanged<T> close;
  final Widget Function(ValueChanged<T> close) builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: context.bottomPadding),
      child: IntrinsicHeight(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            color: SiColors.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              AppBar(
                title: Text(title ?? '', style: SiTextStyles.semibold.copyWith(fontSize: 16)),
                centerTitle: true,
                toolbarHeight: 52,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                scrolledUnderElevation: 0,
              ),
              Expanded(child: builder(close)),
            ],
          ),
        ),
      ),
    );
  }
}
