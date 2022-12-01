import '../models/token.dart';

abstract class TokenServices {
  Future<String> add(Token token);
}
