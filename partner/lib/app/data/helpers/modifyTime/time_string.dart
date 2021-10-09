import 'messages.dart';

///
/// Formats provided [date] to a fuzzy time like 'a moment ago'
/// If [isShort] is passed will look for message for short messages, default is false
/// If [clock] is passed this will be the point of reference for calculating the elapsed time. Defaults to DateTime.now()
/// if [allowFromNow] is passed, format will use the From prefix, ie. a date 5 minutes from now in 'en' locale will display as "5 minutes from now"
String TimeFormat(DateTime date,
    {bool? isShort, DateTime? clock, allowFromNow}) {
  final _isShort = isShort ?? false;
  final _allowFromNow = allowFromNow ?? false;
  final messages = _isShort ? ShortMessages() : Messages();
  final _clock = clock ?? DateTime.now();
  var elapsed = _clock.millisecondsSinceEpoch - date.millisecondsSinceEpoch;

  var prefix;
  var suffix;

  if (_allowFromNow && elapsed < 0) {
    elapsed = date.isBefore(_clock) ? elapsed : elapsed.abs();
    prefix = messages.prefixFromNow();
    suffix = messages.suffixFromNow();
  } else {
    prefix = messages.prefixAgo();
    suffix = messages.suffixAgo();
  }

  final num seconds = elapsed / 1000;
  final num minutes = seconds / 60;
  final num hours = minutes / 60;
  final num days = hours / 24;
  final num months = days / 30;
  final num years = days / 365;

  String result;
  if (seconds < 45)
    result = messages.lessThanOneMinute(seconds.round());
  else if (seconds < 90)
    result = messages.aboutAMinute(minutes.round());
  else if (minutes < 45)
    result = messages.minutes(minutes.round());
  else if (minutes < 90)
    result = messages.aboutAnHour(minutes.round());
  else if (hours < 24)
    result = messages.hours(hours.round());
  else if (hours < 48)
    result = messages.aDay(hours.round());
  else if (days < 30)
    result = messages.days(days.round());
  else if (days < 60)
    result = messages.aboutAMonth(days.round());
  else if (days < 365)
    result = messages.months(months.round());
  else if (years < 2)
    result = messages.aboutAYear(months.round());
  else
    result = messages.years(years.round());

  return [prefix, result, suffix]
      .where((str) => str != null && str.isNotEmpty)
      .join(messages.wordSeparator());
}
