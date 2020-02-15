import 'package:flutter/material.dart';
import '../repository/data_repo.dart';
import '../models/data.dart';
import '../widgets/data_tile.dart';
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

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Data> _datas = <Data>[];

//   @override
//   void initState() {
//     super.initState();
//     listenForBeers();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Top Beers'),
//         ),
//         body: ListView.builder(
//           itemCount: _beers.length,
//           itemBuilder: (context, index) => BeerTile(_beers[index]),
//         ),
//       );

//   void listenForBeers() async {
//     final Stream<Data> stream = await getBeers();
//     stream.listen((Beer beer) => setState(() => _beers.add(beer)));
//   }
// }
