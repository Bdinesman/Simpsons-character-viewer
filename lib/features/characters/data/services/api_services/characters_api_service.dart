import 'dart:convert';

import 'package:simpsonsviewer/features/characters/data/clients/characters_client.dart';
import 'package:simpsonsviewer/features/characters/data/dto/characters_response.dart';

class CharactersApiService {
  const CharactersApiService({required CharactersClient charactersClient})
      : _charactersClient = charactersClient;
  final CharactersClient _charactersClient;

  Future<CharactersResponse> getCharacters() async {
    var response = await _charactersClient.getCharacters();
    var jsonResponse = jsonDecode(response);
    return CharactersResponse.fromJson(jsonResponse);
  }
}
