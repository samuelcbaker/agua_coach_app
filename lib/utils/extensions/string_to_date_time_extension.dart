import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/utils/constants/date_constants.dart';
import 'package:intl/intl.dart';

extension StringToDateTimeExtension on String {
  DateTime toDate({String? format}) {
    try {
      DateTime dateTime = DateFormat(
        format ?? DateConstants.standartDateFormat,
      ).parse(this);

      return dateTime;
    } catch (e) {
      throw StringToDateTimeException();
    }
  }
}
