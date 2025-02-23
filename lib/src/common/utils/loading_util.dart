import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_util.g.dart';

@Riverpod(keepAlive: true)
class Loading extends _$Loading {
  @override
  bool build() => false;

  Future<void> onLoading(AsyncCallback process) async {
    state = true;
    await process();
    state = false;
  }

  void stopLoading() {
    state = false;
  }
}
