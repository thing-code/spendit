import 'dart:async';

/// Debouncer
///
/// **Umumnya digunakan untuk :**
/// * Search
/// * AutoComplete
///
/// **Contoh penggunaan :**
/// ```dart
/// final _debouncer = Debouncer();
/// // Jalankan sebuah method
/// _debouncer.run(() {
///   // do something
/// });
///
/// // Dispose ketika sudah tidak digunakan
/// _debouncer.dispose();
/// ```
///
class Debouncer {
  /// Untuk mengatur delay dari Debouncer
  final Duration delay;

  Debouncer({this.delay = const Duration(milliseconds: 500)});

  Timer? _timer;

  /// Function yang akan dijalankan pada saat debounce
  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  /// Function untuk dispose Timer
  void dispose() {
    _timer?.cancel();
  }
}

/// Throttler
///
/// **Umumnya digunakan untuk :**
/// * Button Click
///
/// **Contoh penggunaan :**
/// ```dart
/// final _throttler = Throttler();
/// // Jalankan sebuah method
/// _throttler.run(() {
///   // do something
/// });
///
/// // Dispose ketika sudah tidak digunakan
/// _throttler.dispose();
/// ```
///
class Throttler {
  /// Untuk mengatur interval dari Throttler
  final Duration interval;

  Throttler({this.interval = const Duration(seconds: 2)});

  bool _isReady = true;

  /// Function yang akan dijalankan menggunakan throttler
  void run(void Function() action) {
    if (!_isReady) return;

    _isReady = false;
    action();
    Future.delayed(interval, () => _isReady = true);
  }
}
