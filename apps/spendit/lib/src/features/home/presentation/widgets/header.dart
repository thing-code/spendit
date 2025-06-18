import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:spendit/src/gen/assets.gen.dart';
import 'package:spendit_core/spendit_core.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * .07,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SpendItColors.neutralColor,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [SpendItStyles.cardShadow],
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(
            backgroundColor: SpendItColors.primaryColor,
            child: Assets.icon.image(width: 24, height: 24, fit: BoxFit.cover),
          ),
          Text(
            'Selamat Datang Kembali!',
            style: SpendItTextStyles.semibold.copyWith(
              fontSize: 16,
              color: SpendItColors.primaryColor,
            ),
          ),
          const Spacer(),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: SpendItColors.accentColor.shade200,
              foregroundColor: SpendItColors.primaryColor,
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            icon: Icon(Iconsax.clock, color: SpendItColors.primaryColor, size: 20),
          ),
        ],
      ),
    );
  }
}
