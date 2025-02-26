import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendit/src/common/common.dart';

class COSLegendWidget extends StatelessWidget {
  const COSLegendWidget({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.w,
      children: [
        Container(
          width: 16,
          height: 8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: color),
        ),
        Text(
          title,
          style: kRegularTextStyle.copyWith(color: context.colorScheme.onPrimary, fontSize: 12),
        ),
      ],
    );
  }
}