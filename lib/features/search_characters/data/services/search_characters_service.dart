import 'dart:async';

import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/characters/domain/repositories/characters_repository.dart';

class SearchCharactersService {
  SearchCharactersService({required CharactersRepository charactersRepository})
      : _charactersRepository = charactersRepository;
  final CharactersRepository _charactersRepository;

  Future<List<CharacterDetailsData>> get characters async {
    try {
      await _charactersRepository.loadCharacters();
      return _charactersRepository.characters;
    } catch (e) {
      rethrow;
    }
  }
}
