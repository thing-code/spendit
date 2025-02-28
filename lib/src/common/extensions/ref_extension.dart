import 'package:flutter/foundation.dart';
import 'package:spendit/src/common/common.dart';

extension WidgetRefLoadingX on WidgetRef {
  Future<void> onLoading(AsyncCallback process) =>
      read(loadingProvider.notifier).onLoading(process);
}

extension RefLoadingX on Ref {
  Future<void> onLoading(AsyncCallback process) =>
      read(loadingProvider.notifier).onLoading(process);
}
