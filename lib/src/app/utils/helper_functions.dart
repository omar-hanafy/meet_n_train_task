class HelperFunctions {
  static int daysBetweenDates({required DateTime from, required DateTime to}) =>
      from.difference(to).inDays;
}
