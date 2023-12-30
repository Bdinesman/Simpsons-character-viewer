import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsonsviewer/core/presentation/navigation/routes/named_go_route.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/search_characters/presentation/search_characters_page.dart';
import 'package:simpsonsviewer/features/view_character_details/presentation/view_character_details_page.dart';

final class SearchCharatersRoute extends NamedGoRoute {
  SearchCharatersRoute({super.routes})
      : super(
          name: routeName,
          path: routePath,
          builder: _builder,
        );
  static const routeName = 'searchCharacters';
  static const routePath = '/characters';

  static Widget _builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SearchCharactersPage();
}

final class CharacterDetailsRoute extends NamedGoRoute {
  CharacterDetailsRoute({super.routes})
      : super(
          name: routeName,
          path: routePath,
          builder: _builder,
        );
  static const routeName = 'characterDetails';
  static const routePath = ':characterName';

  static Widget _builder(
    BuildContext context,
    GoRouterState state,
  ) {
    CharacterDetailsData? characterDetails;
    var uriEncodedName = state.pathParameters['characterName'] ?? '';
    var characterName = Uri.decodeComponent(uriEncodedName);
    var extra = state.extra;
    if (extra is CharacterDetailsData) {
      characterDetails = extra;
    }
    return ViewCharacterDetailsPage(
      characterName: characterName,
      characterDetails: characterDetails,
    );
  }
}
