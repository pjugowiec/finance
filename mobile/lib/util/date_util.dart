import 'package:jiffy/jiffy.dart';

class DateUtil {
  static String getTimeFromDateToNow(DateTime date) {
    num minutes = Jiffy().diff(date, Units.MINUTE);

    return _addPostFixForTime(minutes);
  }


  static String _addPostFixForTime(num minutes) {
    if (minutes < 0) throw Exception('Not supported value');

    if (minutes < 60) {
      return minutes.toString() + 'm';
    } else if (minutes > 60 && minutes < 1440) {
      return (minutes / 60).round().toString() + 'h';
    } else {
      return (minutes / 1440).round().toString() + 'd';
    }
  }
}
