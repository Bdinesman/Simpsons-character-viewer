import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/view_character_details/presentation/cubit/view_character_details_cubit.dart';
import 'package:simpsonsviewer/features/view_character_details/presentation/view_character_details_content.dart';

class ViewCharacterDetailsPage extends StatefulWidget {
  const ViewCharacterDetailsPage({
    super.key,
    this.characterDetails,
    this.characterName,
    this.cubit,
  });
  final CharacterDetailsData? characterDetails;
  final String? characterName;
  final ViewCharacterDetailsCubit? cubit;

  @override
  State<ViewCharacterDetailsPage> createState() =>
      _ViewCharacterDetailsPageState();
}

class _ViewCharacterDetailsPageState extends State<ViewCharacterDetailsPage> {
  late ViewCharacterDetailsCubit _cubit;

  @override
  void initState() {
    _cubit = widget.cubit ??
        ViewCharacterDetailsCubit(
          charactersRepository: GetIt.I.get(),
        );
    _cubit.loadCharacter(
      characterDetails: widget.characterDetails,
      characterName: widget.characterName,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ViewCharacterDetailsPage oldWidget) {
    if (widget.cubit != oldWidget.cubit) {
      _cubit = widget.cubit ??
          ViewCharacterDetailsCubit(
            charactersRepository: GetIt.I.get(),
          );
      _cubit.loadCharacter();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder(
            bloc: _cubit,
            builder: (context, state) => switch (state) {
              ViewCharacterDetailsSuccess(details: var characterDetails) =>
                ViewCharacterDetailsContent(
                  characterDetails: characterDetails,
                ),
              ViewCharacterDetailsInProgress() =>
                const Center(child: CircularProgressIndicator()),
              ViewCharacterDetailsError() => Center(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}
