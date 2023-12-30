import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'characters_client.g.dart';

@RestApi(baseUrl: 'https://api.duckduckgo.com.')
abstract class CharactersClient {
  factory CharactersClient(Dio dio, {String baseUrl}) = _CharactersClient;

  @GET('?q=simpsons+characters&format=json')
  Future<String> getCharacters();
}
