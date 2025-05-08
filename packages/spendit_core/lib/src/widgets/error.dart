import 'package:flutter/material.dart';

class SpendItErrorWidget extends StatelessWidget {
  const SpendItErrorWidget({super.key, this.errorDetails});

  final FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(errorDetails?.toStringShort() ?? 'An Error Occured'),
        ),
      ),
    );
  }
}
