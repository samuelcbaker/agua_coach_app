const notificationJsonMock = ''' 
{
  "id": 1,
  "title": "Beba água",
  "body": "agora",
  "scheduledDateTime": "2022-01-01T10:00:00"
}
''';

const notificationJsonMockWithInvalidDateTime = ''' 
{
  "id": 1,
  "title": "Beba água",
  "body": "agora",
  "scheduledDateTime": "01/01/2022T10:00"
}
''';
