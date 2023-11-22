String formatUploadedTime(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp).toUtc(); // Convert to UTC
  DateTime now = DateTime.now().toUtc(); // Convert current time to UTC
  Duration difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days';
  } else if (difference.inDays < 365) {
    int remainingDays = difference.inDays - (difference.inDays ~/ 30) * 30;
    int months = difference.inDays ~/ 30;
    return '${months} month ${remainingDays} days';
  } else {
    int remainingDays = difference.inDays - (difference.inDays ~/ 365) * 365;
    int years = difference.inDays ~/ 365;
    return '${years}y ${remainingDays}days';
  }
}
