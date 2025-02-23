import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWidget<T> extends ConsumerWidget {
  const AsyncWidget({super.key, required this.asyncValue, required this.onData});

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) onData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (asyncValue) {
      AsyncData(:final value) => onData(value),
      AsyncError(:final error) => Center(child: Text(error.toString())),
      _ => Center(child: CircularProgressIndicator()),
    };
  }
}
