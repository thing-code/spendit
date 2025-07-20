import 'package:flutter/material.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit/src/gen/assets.gen.dart';
import 'package:spendit_core/spendit_core.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.statusBarHeight + context.deviceHeight * .2,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: context.statusBarHeight + context.deviceHeight * .15,
              padding: EdgeInsets.fromLTRB(16, context.statusBarHeight, 16, 0),
              decoration: BoxDecoration(
                gradient: SiGradients.indigoToSkyBlue,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.icon.image(height: 40),
                  Text('Selamat Datang!', style: SiTextStyles.bold.copyWith(fontSize: 24)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              height: context.deviceHeight * .1,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: SiColors.surface,
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
