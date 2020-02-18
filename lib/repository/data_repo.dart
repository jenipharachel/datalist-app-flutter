import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/data.dart';

Future<List<Data>> fetchData(http.Client client) async {
  final response =
      await client.get('https://feeds.citibikenyc.com/stations/stations.json');
  print(response);
  // Use the compute function to run parseData in a separate isolate.
  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Data>.
List<Data> parseData(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['stationBeanList'].cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJSON(json)).toList();
}
