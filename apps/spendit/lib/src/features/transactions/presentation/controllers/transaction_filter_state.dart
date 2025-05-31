import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';

part 'transaction_filter_state.g.dart';

typedef TransactionFilter = ({DateTime? date, TransactionType? type});

@Riverpod(keepAlive: true)
class TransactionFilterState extends _$TransactionFilterState {
  @override
  TransactionFilter build() => (date: null, type: null);

  void setDate(DateTime? date) {
    state = (date: date, type: state.type);
  }

  void setType(TransactionType? type) {
    state = (date: state.date, type: type);
  }

  void reset() {
    state = (date: null, type: null);
  }
}
