import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/data.dart';

Future<List<Data>> fetchData() async {
  final client = new http.Client();
  final response =
      await client.get('https://feeds.citibikenyc.com/stations/stations.json');
  // Use the compute function to run parseData in a separate isolate.
  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Data>.
List<Data> parseData(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['stationBeanList'].cast<Map<String, dynamic>>();

  return parsed.map((json) => Data.fromJson(json)).toList();
}
