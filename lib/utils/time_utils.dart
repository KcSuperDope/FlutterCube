class TimeUtils {
  static String formatTime(int milliseconds) {
    int minute = milliseconds ~/ 1000 ~/ 60;
    int second = milliseconds ~/ 1000 % 60;
    int millisecond = milliseconds % 1000 ~/ 10;
    String str =
        '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}.${millisecond.toString().padLeft(2, '0')}';
    return str;
  }

  static String formatSeconds(int milliseconds) {
    return (milliseconds / 1000).toStringAsFixed(2);
  }
}
