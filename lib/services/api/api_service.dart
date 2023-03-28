import 'dart:convert';
import 'dart:developer';
import 'package:apidata/model/album_model.dart';
import 'package:apidata/model/photo_model.dart';
import 'package:apidata/services/api/constants.dart';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<PhotoModel>?> usersPhoto() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.photo);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PhotoModel> model = photoModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//update edit
  // Future<List<AlbumModel>?> updateAlbum(String title) async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.album);
  //     var response = await http.get(url);
  //    <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     };
  //     jsonEncode(<String, String>{
  //       'title': title,
  //     });
  //     if (response.statusCode == 200) {
  //       List<AlbumModel> model = albumModelFromJson(response.body);
  //       return model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return null;
  // }
  ///
  Future<AlbumModel> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<AlbumModel> updateAlbum(String title) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
}
