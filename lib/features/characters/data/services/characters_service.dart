import 'package:simpsonsviewer/features/characters/data/services/api_services/characters_api_service.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';

class CharactersService {
  const CharactersService({required CharactersApiService charactersApiService})
      : _charactersApiService = charactersApiService;
  final CharactersApiService _charactersApiService;

  Future<List<CharacterDetailsData>> get characters async {
    try {
      var response = await _charactersApiService.getCharacters();
      return response.characters
          .map(CharacterDetailsData.fromViewCharacterResponse)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
