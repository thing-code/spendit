import 'package:flutter/material.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit_core/spendit_core.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.viewPaddingOf(context).top;
    return SizedBox(
      height: 150 + statusBarHeight,
      child: Stack(
        children: [
          Container(
            height: 100 + statusBarHeight,
            width: context.deviceWidth,
            decoration: BoxDecoration(color: SIColors.primaryColor),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: statusBarHeight),
            child: Text(
              'Selamat Datang',
              style: SITextStyles.semibold.copyWith(fontSize: 20, color: SIColors.neutralColor),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: SIColors.neutralColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: SIStyles.cardShadow,
              ),
              child: BalanceSection(),
            ),
          ),
        ],
      ),
    );
  }
}
