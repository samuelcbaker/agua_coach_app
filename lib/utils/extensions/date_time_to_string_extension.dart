import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/utils/constants/date_constants.dart';
import 'package:intl/intl.dart';

extension DateTimeToStringExtension on DateTime {
  String toStringDate({String? format}) {
    try {
      String stringDate = DateFormat(
        format ?? DateConstants.standartDateFormat,
      ).format(this);

      return stringDate;
    } catch (e) {
      throw DateTimeToStringException();
    }
  }
}
