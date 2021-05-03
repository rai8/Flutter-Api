import 'package:playround/model/albums_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<Albums>> fetchAlbum() async {
  var url = 'https://jsonplaceholder.typicode.com/albums';
  // Uri.https('jsonplaceholder.typicode.com', '/albums', {'q': '{http}'});
  final response = await http.get(url);
  print(response.body);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Albums.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
