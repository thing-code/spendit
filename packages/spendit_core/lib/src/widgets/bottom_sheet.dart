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
    return SizedBox(
      height: height ?? context.deviceHeight / 2,
      width: context.deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 56,
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
                          color: SpendItColors.primaryColor.shade100,
                        ),
                        height: 6,
                        width: 48,
                      ),
                    ),
                  ),
                if (showCloseIcon)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: SpendItColors.primaryColor.shade100,
                        foregroundColor: SpendItColors.primaryColor,
                        iconSize: 16,
                      ),
                      constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                      onPressed: () => _popModal(context),
                      icon: Icon(Icons.close),
                    ),
                  ),
                if (title case final String title)
                  Positioned(
                    left: 16,
                    top: showCloseIcon ? 16 : 24,
                    child: Text(
                      title,
                      style: SpendItTextStyles.semibold.copyWith(fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(child: builder(context)),
        ],
      ),
    );
  }

  void _popModal(BuildContext context) {
    Navigator.pop(context);
  }
}
