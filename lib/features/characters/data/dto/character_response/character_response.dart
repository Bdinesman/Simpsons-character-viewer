import 'package:json_annotation/json_annotation.dart';
import 'package:simpsonsviewer/core/utils/json_utils.dart';
import 'package:simpsonsviewer/features/characters/data/dto/character_icon_response/character_icon_response.dart';

part 'character_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
final class CharacterResponse with ToJsonMixin {
  const CharacterResponse({
    this.firstUrl,
    this.icon,
    this.result,
    this.text,
  });

  factory CharacterResponse.fromJson(Json json) =>
      _$CharacterResponseFromJson(json);
  final String? firstUrl;
  final CharacterIconResponse? icon;
  final String? result;
  final String? text;

  @override
  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}
