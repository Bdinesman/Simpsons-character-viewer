import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsonsviewer/core/presentation/navigation/routes/character_routes.dart';
import 'package:simpsonsviewer/core/utils/localization_utils.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';

class SearchCharactersContent extends StatelessWidget {
  const SearchCharactersContent({
    super.key,
    required this.onSearchTermChanged,
    required this.characters,
  });

  final void Function(String) onSearchTermChanged;
  final List<CharacterDetailsData> characters;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    onChanged: onSearchTermChanged,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText:
                          context.appLocalizations.searchCharactersHintText,
                    ),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: characters.length,
                    itemBuilder: (context, index) =>
                        _CharacterListTile(character: characters[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CharacterListTile extends StatelessWidget {
  const _CharacterListTile({required this.character});
  final CharacterDetailsData character;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.goNamed(
        CharacterDetailsRoute.routeName,
        pathParameters: {
          'characterName': Uri.encodeComponent(character.name),
        },
        extra: character,
      ),
      child: Text(character.name),
    );
  }
}
