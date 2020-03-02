class Data {
  final int id;
  final String stationName;
  final String statusValue;
  final int availableDocks;
  final int availableBikes;

  Data(
      {this.id,
      this.stationName,
      this.statusValue,
      this.availableDocks,
      this.availableBikes});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      stationName: json['title'] as String,
      statusValue: json['statusValue'] as String,
      availableDocks: json['availableDocks'] as int,
      availableBikes: json['availableBikes'] as int,
    );
  }
}
