import '../common.dart';

class COSLinearProgress extends StatelessWidget {
  const COSLinearProgress({super.key, this.value, this.color, this.height = 8, this.gap =2});

  final double? value;
  final Color? color;
  final double height;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      borderRadius: BorderRadius.circular(100),
      backgroundColor: context.colorScheme.primary.withAlpha(30),
      valueColor: AlwaysStoppedAnimation(color),
      stopIndicatorColor: color,
      stopIndicatorRadius: (height / 2).r,
      minHeight: height.h,
      trackGap: gap,
      // ignore: deprecated_member_use
      year2023: false,
    );
  }
}
