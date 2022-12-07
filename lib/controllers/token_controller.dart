import 'package:power_fuel_client_app/models/token.dart';
import 'package:power_fuel_client_app/repositories/token_service.dart';

class TokenController {
  final TokenServices services;

  TokenController(this.services);
  Future<String> add(Token token) {
    return services.add(token);
  }

  Future<String> validate(int id) {
    return services.validate(id);
  }

  Future<Token> getToken(int id) {
    return services.getToken(id);
  }

  Future<List<Token>> fetchTokens(int id) {
    return services.tokens(id);
  }
}
