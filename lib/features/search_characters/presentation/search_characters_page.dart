import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simpsonsviewer/core/utils/localization_utils.dart';
import 'package:simpsonsviewer/features/search_characters/domain/repositories/search_characters_repository.dart';
import 'package:simpsonsviewer/features/search_characters/presentation/cubit/search_characters_cubit.dart';
import 'package:simpsonsviewer/features/search_characters/presentation/search_characters_content.dart';
import 'package:simpsonsviewer/features/search_characters/presentation/widgets/search_characters_error_widget.dart';

class SearchCharactersPage extends StatefulWidget {
  const SearchCharactersPage({super.key, this.cubit});
  final SearchCharactersCubit? cubit;
  @override
  State<SearchCharactersPage> createState() => _SearchCharactersPageState();
}

class _SearchCharactersPageState extends State<SearchCharactersPage> {
  late SearchCharactersCubit _charactersCubit;
  @override
  void initState() {
    _charactersCubit = widget.cubit ??
        SearchCharactersCubit(
          searchCharactersRepository: SearchCharactersRepository(
            searchCharactersService: GetIt.I.get(),
          ),
        );
    _charactersCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Mimics native iOS behavior by unfocusing search fields when
    //user taps outside
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.appLocalizations.searchCharactersTitle),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: BlocBuilder(
            bloc: _charactersCubit,
            builder: (context, state) {
              return switch (state) {
                SearchCharactersInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                SearchCharactersSuccess(characters: var characters) =>
                  SearchCharactersContent(
                    characters: characters,
                    onSearchTermChanged: _charactersCubit.search,
                  ),
                SearchCharactersError(error: var error) =>
                  SearchCharactersErrorWidget(
                    error: error,
                    onTryAgainPressed: _charactersCubit.init,
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
