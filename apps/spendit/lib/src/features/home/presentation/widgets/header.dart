import 'package:flutter/material.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit_core/spendit_core.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.viewPaddingOf(context).top;
    return SizedBox(
      height: 120 + statusBarHeight,
      child: Stack(
        children: [
          Container(
            height: 80 + statusBarHeight,
            width: context.deviceWidth,
            decoration: BoxDecoration(color: SiColors.primary),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: statusBarHeight),
            child: Text(
              'Selamat Datang',
              style: SiTextStyles.semibold.copyWith(fontSize: 20, color: SiColors.text),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: SiColors.text,
                borderRadius: BorderRadius.circular(16),
              ),
              child: BalanceSection(),
            ),
          ),
        ],
      ),
    );
  }
}
