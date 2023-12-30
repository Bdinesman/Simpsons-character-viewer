import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/search_characters/domain/repositories/search_characters_repository.dart';

part 'search_characters_state.dart';

class SearchCharactersCubit extends Cubit<SearchCharactersState> {
  SearchCharactersCubit(
      {required SearchCharactersRepository searchCharactersRepository})
      : _searchCharactersRepository = searchCharactersRepository,
        super(SearchCharactersInitial());
  final SearchCharactersRepository _searchCharactersRepository;

  Future<void> init() async {
    try {
      emit(SearchCharactersInProgress());
      await _searchCharactersRepository.loadCharacters();
      emit(SearchCharactersSuccess(
          characters: _searchCharactersRepository.characters));
    } catch (error) {
      emit(SearchCharactersError(error: error));
    }
  }

  Future<void> search(String searchTerm) async {
    try {
      List<CharacterDetailsData> characters = [];
      emit(SearchCharactersInProgress());
      if (searchTerm.isEmpty) {
        characters = _searchCharactersRepository.characters;
      } else {
        characters = _searchCharactersRepository
            .getCharactersContainingSearchTerm(searchTerm);
      }
      emit(
        SearchCharactersSuccess(characters: characters),
      );
    } catch (error) {
      emit(SearchCharactersError(error: error));
    }
  }
}
