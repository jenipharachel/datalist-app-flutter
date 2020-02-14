import 'package:flutter/material.dart';
import '../models/datasplit.dart';

class DataTile extends StatelessWidget {
  final Bike _station;
  DataTile(this._station);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: Text(_station.stationName),
            subtitle: Text(_station.statusValue),
          ),
          Divider()
        ],
      );
}
