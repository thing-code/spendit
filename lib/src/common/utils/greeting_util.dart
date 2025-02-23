class GreetingUtil {
  static String _greeting() {
    final now = DateTime.now();

    if (now.hour < 12) {
      return 'Good Morning';
    } else if (now.hour < 15) {
      return 'Good Afternoon';
    } else if (now.hour < 18) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static String get greeting => _greeting();
}
