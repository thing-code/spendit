import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({
    super.key,
    this.showCloseIcon = false,
    this.title,
    this.height,
    required this.builder,
  });

  final bool showCloseIcon;
  final String? title;
  final double? height;
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: height ?? context.deviceHeight / 2,
        width: context.deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: title != null ? 56 : 32,
              child: Stack(
                children: [
                  if (!showCloseIcon)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: SIColors.primaryColor.shade100,
                          ),
                          height: 4,
                          width: 72,
                        ),
                      ),
                    ),
                  if (showCloseIcon)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: IconButton.filledTonal(
                        style: IconButton.styleFrom(iconSize: 20),
                        constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                        onPressed: () => _popModal(context),
                        icon: Icon(Icons.close),
                      ),
                    ),
                  if (title case final String title)
                    Positioned(
                      left: 16,
                      top: showCloseIcon ? 16 : 24,
                      child: Text(title, style: SITextStyles.medium.copyWith(fontSize: 16)),
                    ),
                ],
              ),
            ),
            Expanded(child: builder(context)),
          ],
        ),
      ),
    );
  }

  void _popModal(BuildContext context) {
    Navigator.pop(context);
  }
}
