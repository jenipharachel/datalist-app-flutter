import 'package:flutter/material.dart';
import 'dart:convert';
import '../repository/data_repo.dart';
import '../widgets/data_tile.dart';
import '../models/data.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> _dataList = <Data>[];
  // List _dataList = new List();

  @override
  void initState() {
    super.initState();
    listenForDatas();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Bike Stations in NYC'),
        ),
        body: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) => DatasList(_dataList[index]),
        ),
      );

  void listenForDatas() async {
    // void makeRequest() async {
    // final List<Data> list = await fetchData();

    String url = "https://feeds.citibikenyc.com/stations/stations.json";
    http.Response response = await http.get(url);
    print(json.decode(response.body));
    List<Data> apiData = json
        .decode(response.body)['stationBeanList']
        .cast<Map<String, dynamic>>()
        .map((data) => Data.fromJson(data))
        .cast<List<Data>>();

    print(apiData);
    // print(list);

    setState(() {
      _dataList = apiData;
    });
  }
}
