part of 'view_character_details_cubit.dart';

sealed class ViewCharacterDetailsState extends Equatable {
  const ViewCharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class ViewCharacterDetailsInitial extends ViewCharacterDetailsState {}

final class ViewCharacterDetailsInProgress extends ViewCharacterDetailsState {}

final class ViewCharacterDetailsSuccess extends ViewCharacterDetailsState {
  const ViewCharacterDetailsSuccess({required this.details});
  final CharacterDetailsData details;
  @override
  List<Object> get props => [details];
}

final class ViewCharacterDetailsError extends ViewCharacterDetailsState {
  const ViewCharacterDetailsError({required this.error});
  final Object error;
  @override
  List<Object> get props => [error];
}
