class Bike {
  final int id;
  final String stationName;
  final String statusValue;
  final int availableBikes;

  Bike.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        stationName = jsonMap['stationName'],
        statusValue = jsonMap['statusValue'],
        availableBikes = jsonMap['availableBikes'];
}
