import 'package:flutter/material.dart';
import '../repo/data_from_api.dart';
import '../models/datasplit.dart';
import '../widgets/datatile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Bike> _stations = <Bike>[];

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data List of Bike stations-NYC'),
        ),
        body: ListView.builder(
          itemCount: _stations.length,
          itemBuilder: (context, index) => DataTile(_stations[index]),
        ),
      );

  void getApiData() async {
    final Stream<Bike> stream = await getStations();
    stream.listen((Bike bike) => setState(() => _stations.add(bike)));
  }
}
