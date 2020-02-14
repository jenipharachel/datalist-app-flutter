import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/datasplit.dart';

Future<Stream<Bike>> getStations() async {
  final String url = 'http://citibikenyc.com/stations/json';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  debugPrint('stream: $streamedRest');
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Bike.fromJSON(jsonDecode(data)['stationBeanList']));
}
