String convertDateTeimeToString(DateTime datetime) {
  String year = datetime.year.toString();
  String month = datetime.month.toString();
  String day = datetime.day.toString();

  if (month.length == 1) {
    month = '0$month';
  }

  if (day.length == 1) {
    day = '0$day';
  }

  return year + month + day;
}
