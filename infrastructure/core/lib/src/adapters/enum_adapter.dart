String enumToString(Object o) => o.toString().split('.').last;
T? stringToEnum<T>(String key, List<T?> values) => values.firstWhere((v) => key == enumToString(v!));
