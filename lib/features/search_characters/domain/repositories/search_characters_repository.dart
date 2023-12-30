import 'dart:async';

import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/search_characters/data/services/search_characters_service.dart';

class SearchCharactersRepository {
  SearchCharactersRepository(
      {required SearchCharactersService searchCharactersService})
      : _searchCharactersService = searchCharactersService;
  final SearchCharactersService _searchCharactersService;
  List<CharacterDetailsData> _characters = [];

  Future<void> init() async {
    try {
      await loadCharacters();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadCharacters() async {
    try {
      _characters = await _searchCharactersService.characters;
    } catch (e) {
      rethrow;
    }
  }

  ///All availble characters
  //The returned list needs to be a copy of [_characters] to prevent outside sources
  //from mutating the original data
  List<CharacterDetailsData> get characters => List.unmodifiable(_characters);

  List<CharacterDetailsData> getCharactersContainingSearchTerm(
      String searchTerm) {
    //Prevent use of special RegEx characters or wildCardSearches
    var specialCharacters = r'[{}\.+\$^*?[]|]';
    final sanitizedSearchTerm = searchTerm
        .replaceAll('\\', '')
        .replaceAllMapped(RegExp(specialCharacters), (m) => '\\${m[0]}');
    final sanitizedRegExp = RegExp(sanitizedSearchTerm, caseSensitive: false);
    return _characters
        .where(
          (character) =>
              character.name.contains(sanitizedRegExp) ||
              character.description.contains(sanitizedRegExp),
        )
        .toList();
  }
}
