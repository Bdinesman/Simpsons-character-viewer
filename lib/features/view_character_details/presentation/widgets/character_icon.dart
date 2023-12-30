import 'package:flutter/material.dart';
import 'package:simpsonsviewer/features/characters/domain/entities/character_details_data.dart';

class CharacterDetailsIcon extends StatelessWidget {
  const CharacterDetailsIcon({
    super.key,
    required this.characterDetails,
    this.size,
  });
  final CharacterDetailsData characterDetails;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = colorScheme.secondary;
    final iconSrc = characterDetails.iconSrc;
    if (iconSrc == null) {
      var initials = _getInitials(characterDetails.name);
      return CircleAvatar(
        radius: size,
        backgroundColor: backgroundColor,
        child: Text(
          initials,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: colorScheme.onSecondary,
              ),
        ),
      );
    }
    return SizedBox(
      width: size,
      height: size == null ? null : size! * 3,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(iconSrc.toString()),
      ),
    );
  }

  String _getInitials(String characterName) {
    //Using a RegExp is safer than using substrings in the event the character
    //name returned is an empty String
    var regExp = RegExp(r'(?<Initial>(?<=^|\s)\w)\w*(\s|$)');
    return regExp.allMatches(characterName).fold('',
        (initials, match) => '$initials${match.namedGroup('Initial') ?? ''}');
  }
}
