import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/characters/domain/repositories/characters_repository.dart';

part 'view_character_details_state.dart';

class ViewCharacterDetailsCubit extends Cubit<ViewCharacterDetailsState> {
  ViewCharacterDetailsCubit({
    required CharactersRepository charactersRepository,
  })  : _charactersRepository = charactersRepository,
        super(ViewCharacterDetailsInitial());
  final CharactersRepository _charactersRepository;

  Future<void> loadCharacter({
    CharacterDetailsData? characterDetails,
    String? characterName,
  }) async {
    assert(characterDetails != null || characterName != null);
    //Prevent user from loading character data multiple times
    if (state is ViewCharacterDetailsInProgress ||
        state is ViewCharacterDetailsSuccess) return;
    emit(ViewCharacterDetailsInProgress());
    try {
      await _charactersRepository.init();
      if (characterDetails != null) {
        return emit(ViewCharacterDetailsSuccess(details: characterDetails));
      }
      try {
        var details = _charactersRepository.characters
            .firstWhere((character) => character.name == characterName);
        emit(ViewCharacterDetailsSuccess(details: details));
      } catch (e) {
        throw Exception('No matching character found');
      }
    } catch (error) {
      return emit(ViewCharacterDetailsError(error: error));
    }
  }
}
