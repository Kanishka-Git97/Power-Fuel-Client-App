import '../models/token.dart';

abstract class TokenServices {
  Future<String> add(Token token);
  Future<String> validate(int id);
  Future<Token> getToken(int id);
}
