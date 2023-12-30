import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';
import 'package:simpsonsviewer/features/view_character_details/presentation/widgets/character_description.dart';
import 'package:simpsonsviewer/features/view_character_details/presentation/widgets/character_icon.dart';

class ViewCharacterDetailsContent extends StatelessWidget {
  const ViewCharacterDetailsContent({
    super.key,
    required this.characterDetails,
  });
  final CharacterDetailsData characterDetails;
  @override
  Widget build(BuildContext context) {
    return switch (MediaQuery.orientationOf(context)) {
      Orientation.landscape => _LandscapeViewCharacterDetailsContent(
          characterDetails: characterDetails),
      Orientation.portrait => _PortraitViewCharacterDetailsContent(
          characterDetails: characterDetails),
    };
  }
}

class _LandscapeViewCharacterDetailsContent extends StatelessWidget {
  const _LandscapeViewCharacterDetailsContent({
    required this.characterDetails,
  });
  final CharacterDetailsData characterDetails;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: min(200.0, constraints.maxWidth / 3),
              child: Center(
                child: SizedBox.expand(
                  child: CharacterDetailsIcon(
                    characterDetails: characterDetails,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        characterDetails.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    CharacterDescription(
                      description: characterDetails.description,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PortraitViewCharacterDetailsContent extends StatelessWidget {
  const _PortraitViewCharacterDetailsContent({
    required this.characterDetails,
  });
  final CharacterDetailsData characterDetails;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            CharacterDetailsIcon(
              characterDetails: characterDetails,
              size: min(60.0, constraints.maxWidth / 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                characterDetails.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            CharacterDescription(
              description: characterDetails.description,
            ),
          ],
        );
      },
    );
  }
}
