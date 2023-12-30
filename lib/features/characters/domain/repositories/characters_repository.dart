import 'dart:async';

import 'package:simpsonsviewer/features/characters/data/services/characters_service.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';

class CharactersRepository {
  CharactersRepository({required CharactersService charactersService})
      : _charactersService = charactersService;
  final CharactersService _charactersService;
  List<CharacterDetailsData> _characters = [];
  Completer<bool>? _initiatedCompleter;
  Future<bool> init() async {
    if (_initiatedCompleter != null) return _initiatedCompleter!.future;
    _initiatedCompleter = Completer();
    try {
      await loadCharacters();
      _initiatedCompleter!.complete(true);
      return _initiatedCompleter!.future;
    } catch (e) {
      _initiatedCompleter = null;
      return false;
    }
  }

  Future<void> loadCharacters() async {
    try {
      _characters = await _charactersService.characters;
    } catch (e) {
      rethrow;
    }
  }

  ///All availble characters
  //The returned list needs to be a copy of [_characters] to prevent outside sources
  //from mutating the original data
  List<CharacterDetailsData> get characters => List.unmodifiable(_characters);

  void reset() {
    _initiatedCompleter = null;
    _characters = [];
  }
}
