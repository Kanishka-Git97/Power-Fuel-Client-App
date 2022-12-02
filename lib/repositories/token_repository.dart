import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/models/token.dart';
import 'package:power_fuel_client_app/repositories/token_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TokenRepository implements TokenServices {
  @override
  Future<String> add(Token token) async {
    print(token.toJson());
    var url = Uri.parse('$baseUrl/token/add');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(token.toJson()));
    if (response.statusCode == 200) return response.body;
    return "false: ${response.statusCode}";
  }

  @override
  Future<String> validate(int id) async {
    print("validation $id");
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/token/validate');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return response.body;
    }
    return "error";
  }

  @override
  Future<Token> getToken(int id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/token/get');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return Token.fromJson(json.decode(response.body));
    }
    return Token();
  }
}
