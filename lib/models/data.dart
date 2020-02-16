class Data {
  final int id;
  final String stationName;
  final String statusValue;
  final int availableDocks;
  final int availableBikes;

  Data.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        stationName = jsonMap['stationName'],
        statusValue = jsonMap['statusValue'],
        availableDocks = jsonMap['availableDocks'],
        availableBikes = jsonMap['availableBikes'];
}
