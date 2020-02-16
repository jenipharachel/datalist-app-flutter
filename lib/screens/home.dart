import 'package:flutter/material.dart';
import '../repository/data_repo.dart';
import '../models/data.dart';
import 'package:http/http.dart' as http;

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
