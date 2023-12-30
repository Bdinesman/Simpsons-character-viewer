import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simpsonsviewer/core/utils/json_utils.dart';
import 'package:simpsonsviewer/features/characters/data/dto/character_response/character_response.dart';

part 'character_details_data.g.dart';

final RegExp _characterResponseRegex =
    RegExp(r'^(?<Name>.+)\s-\s(?<Description>.+)$');

@JsonSerializable()
final class CharacterDetailsData with EquatableMixin, ToJsonMixin {
  const CharacterDetailsData({
    required this.name,
    required this.description,
    this.iconSrc,
  });

  factory CharacterDetailsData.fromViewCharacterResponse(
      CharacterResponse response) {
    var match = _characterResponseRegex.firstMatch(response.text!);
    var (name, description) = (
      match?.namedGroup('Name'),
      match?.namedGroup('Description'),
    );
    if (name == null || description == null) throw Exception();
    return CharacterDetailsData(
      name: name,
      description: description,
      iconSrc: response.icon?.url,
    );
  }

  final String name;
  final String description;
  final Uri? iconSrc;

  @override
  List<Object?> get props => [
        name,
        description,
        iconSrc,
      ];

  @override
  Map<String, dynamic> toJson() => _$CharacterDetailsDataToJson(this);
}
