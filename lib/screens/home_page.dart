import 'package:flutter/material.dart';
import 'package:playround/model/albums_model.dart';
import 'package:playround/services/albums_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Albums>> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Working with API'),
        centerTitle: true,
        backgroundColor: Colors.pink[500],
        elevation: 0.0,
      ),
      body: Center(
        child: FutureBuilder<List<Albums>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Albums> album = snapshot.data;
              return ListView.builder(
                  itemCount: album.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(album[index].title),
                      subtitle: Text(album[index].userId.toString()),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
