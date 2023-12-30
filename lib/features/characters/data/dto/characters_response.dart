import 'package:json_annotation/json_annotation.dart';
import 'package:simpsonsviewer/core/utils/json_utils.dart';
import 'package:simpsonsviewer/features/characters/data/dto/character_response/character_response.dart';
part 'characters_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
final class CharactersResponse with ToJsonMixin {
  const CharactersResponse({
    required this.characters,
  });
  factory CharactersResponse.fromJson(Json json) =>
      _$CharactersResponseFromJson(json);
  @JsonKey(name: 'RelatedTopics')
  final List<CharacterResponse> characters;

  @override
  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}
