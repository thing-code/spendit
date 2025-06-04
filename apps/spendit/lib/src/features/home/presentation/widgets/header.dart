import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/gen/assets.gen.dart';

class SpendItHeader extends StatelessWidget {
  const SpendItHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * .07,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SpendItColors.neutralColor,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [SpendItStyles.cardShadow],
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            backgroundColor: SpendItColors.primaryColor,
            child: Assets.icon.image(width: 24, height: 24, fit: BoxFit.cover),
          ),
          Text(
            'Selamat Datang Kembali!',
            style: SpendItTextStyles.bold.copyWith(fontSize: 18, color: SpendItColors.primaryColor),
          ),
          const Spacer(),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: SpendItColors.accentColor.shade200,
              foregroundColor: SpendItColors.primaryColor,
            ),
            onPressed: () {},
            icon: Icon(SolarIconsOutline.history),
          ),
        ],
      ),
    );
  }
}
