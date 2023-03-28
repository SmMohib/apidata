import 'dart:developer';
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
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

   Future<List<PhotoModel>?> usersPhoto() async {
    try {
      
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.photo);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PhotoModel> _model = photoModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
