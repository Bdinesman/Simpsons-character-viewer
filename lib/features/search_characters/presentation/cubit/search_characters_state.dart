part of 'search_characters_cubit.dart';

@immutable
sealed class SearchCharactersState extends Equatable {}

final class SearchCharactersInitial extends SearchCharactersState {
  @override
  List<Object?> get props => [];
}

final class SearchCharactersInProgress extends SearchCharactersState {
  @override
  List<Object?> get props => [];
}

final class SearchCharactersSuccess extends SearchCharactersState {
  SearchCharactersSuccess({required this.characters});
  final List<CharacterDetailsData> characters;
  @override
  List<Object?> get props => [characters];
}

final class SearchCharactersError extends SearchCharactersState {
  SearchCharactersError({required this.error});
  final Object error;
  @override
  List<Object?> get props => [error];
}
