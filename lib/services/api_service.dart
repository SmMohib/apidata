import 'dart:developer';
import 'package:apidata/model/data.dart';
import 'package:apidata/services/constants.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

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
  
  Future<List<Welcome>?> getdata() async {
    try {
      var url = Uri.parse(ApiConstants.dataurl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Welcome> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
