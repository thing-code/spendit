import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class COSAsyncWidget<T> extends ConsumerWidget {
  const COSAsyncWidget({super.key, required this.asyncValue, required this.onData, this.onLoading});

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) onData;
  final Widget Function()? onLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (asyncValue) {
      AsyncData(:final value) => onData(value),
      AsyncError(:final error) => Center(child: Text(error.toString())),
      _ => onLoading?.call() ?? Center(child: CircularProgressIndicator()),
    };
  }
}
