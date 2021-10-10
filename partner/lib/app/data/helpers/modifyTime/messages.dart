abstract class LookupMessages {
  String prefixAgo();
  String prefixFromNow();
  String suffixAgo();
  String suffixFromNow();
  String lessThanOneMinute(int seconds);
  String aboutAMinute(int minutes);
  String minutes(int minutes);
  String aboutAnHour(int minutes);
  String hours(int hours);
  String aDay(int hours);
  String days(int days);
  String aboutAMonth(int days);
  String months(int months);
  String aboutAYear(int year);
  String years(int years);
  wordSeparator() => ' ';
}

class Messages implements LookupMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => 'ago';
  String suffixFromNow() => 'from now';
  String lessThanOneMinute(int seconds) => 'a moment';
  String aboutAMinute(int minutes) => 'a minute';
  String minutes(int minutes) => '$minutes minutes';
  String aboutAnHour(int minutes) => 'about an hour';
  String hours(int hours) => '$hours hours';
  String aDay(int hours) => 'a day';
  String days(int days) => '$days days';
  String aboutAMonth(int days) => 'about a month';
  String months(int months) => '$months months';
  String aboutAYear(int year) => 'about a year';
  String years(int years) => '$years years';
  wordSeparator() => ' ';
}

class ShortMessages implements LookupMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'now';
  String aboutAMinute(int minutes) => '1 min';
  String minutes(int minutes) => '$minutes min';
  String aboutAnHour(int minutes) => '~1 h';
  String hours(int hours) => '$hours h';
  String aDay(int hours) => '~1 d';
  String days(int days) => '$days d';
  String aboutAMonth(int days) => '~1 mo';
  String months(int months) => '$months mo';
  String aboutAYear(int year) => '~1 yr';
  String years(int years) => '$years yr';
  wordSeparator() => ' ';
}
