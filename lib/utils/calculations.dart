String numberFormat(String x) {
  double typeValue = double.parse(x);
  List<String> parts = typeValue.toString().split('.');
  RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

  parts[0] = parts[0].replaceAll(re, '.');
  if (parts.length == 1) {
    parts.add('00');
  } else {
    parts[1] = parts[1].padRight(2, '0').substring(0, 2);
  }
  return parts.join(',');
}

double calculatePercentage(String value, String percentage) {
  String convertPercentage = "0." + percentage;
  double typeValue = double.parse(value);
  double typePercentage = double.parse(convertPercentage);
  double calculateOne = (typeValue * typePercentage);
  double calculateTwo = (typeValue - calculateOne);
  return calculateTwo;
}

String ucFirst(String str) {
  if (str == null || str.isEmpty) {
    return "";
  } else {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }
}
