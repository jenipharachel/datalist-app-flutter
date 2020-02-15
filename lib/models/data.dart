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

// class Data {
//   final int id;
//   final String stationName;
//   final String statusValue;
//   final int availableDocks;
//   final int availableBikes;

//   Data(
//       {this.id,
//       this.stationName,
//       this.statusValue,
//       this.availableDocks,
//       this.availableBikes});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       id: json['id'] as int,
//       stationName: json['stationName'] as String,
//       statusValue: json['statusValue'] as String,
//       availableDocks: json['availableDocks'] as int,
//       availableBikes: json['availableBikes'] as int,
//     );
//   }
// }

// class Data {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;

//   Data({this.albumId, this.id, this.title, this.url});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//     );
//   }
// }
