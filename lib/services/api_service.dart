import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutterapi/constants.dart';
import 'package:flutterapi/models/loins_model.dart';

class ApiService {
  Future<List<Loins>?> getLoins() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Loins> _model = loinsFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}