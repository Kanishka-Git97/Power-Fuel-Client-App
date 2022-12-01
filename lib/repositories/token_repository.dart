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
    if (response.statusCode == 200) return "true";
    return "false: ${response.statusCode}";
  }
}
