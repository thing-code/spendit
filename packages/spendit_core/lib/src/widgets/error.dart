import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class SiErrorWidget extends StatelessWidget {
  const SiErrorWidget({super.key, this.errorDetails});

  final FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(IconsaxPlusBold.danger, color: SiColors.danger),
              Text(errorDetails?.toStringShort() ?? 'An Error Occured'),
            ],
          ),
        ),
      ),
    );
  }
}
