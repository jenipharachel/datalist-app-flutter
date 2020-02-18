import 'package:flutter/material.dart';
import '../models/data.dart';

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
