import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> fetchData(http.Client client) async {
  final response =
      await client.get('https://feeds.citibikenyc.com/stations/stations.json');

  // Use the compute function to run parseData in a separate isolate.
  return compute(parseData, response.body);
}

// A function that converts a response body into a List<Data>.
List<Data> parseData(String responseBody) {
  // var tagsJson = jsonDecode(responseBody)['tags'];
  // List<String> tags = tagsJson != null ? List.from(tagsJson) : null;
  final parsed =
      jsonDecode(responseBody)['stationBeanList'].cast<Map<String, dynamic>>();

  return parsed.map<Data>((json) => Data.fromJson(json)).toList();
}

class Data {
  final int id;
  final String stationName;
  final String statusValue;
  final int availableDocks;

  Data({this.id, this.stationName, this.statusValue, this.availableDocks});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      stationName: json['stationName'] as String,
      statusValue: json['statusValue'] as String,
      availableDocks: json['availableDocks'] as int,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo of Data';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.red),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Data>>(
        future: fetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? DatasList(datas: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DatasList extends StatelessWidget {
  final List<Data> datas;

  DatasList({Key key, this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return (ListTile(
            title: Text(datas[index].stationName),
            subtitle: Text(datas[index].statusValue),
          ));
        });
  }
}
