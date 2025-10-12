import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/themes/themes.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          'Balance',
          style: TextStyle(fontSize: 16, color: SiColors.textSecondary),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rp 1.000.000',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: HugeIcon(icon: HugeIcons.strokeRoundedView),
            ),
          ],
        ),
      ],
    );
  }
}
