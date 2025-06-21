import 'package:flutter/material.dart';

class SIErrorWidget extends StatelessWidget {
  const SIErrorWidget({super.key, this.errorDetails});

  final FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text(errorDetails?.toStringShort() ?? 'An Error Occured')),
      ),
    );
  }
}
