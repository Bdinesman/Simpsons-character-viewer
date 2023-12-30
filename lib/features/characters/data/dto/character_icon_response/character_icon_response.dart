import 'package:json_annotation/json_annotation.dart';
import 'package:simpsonsviewer/core/utils/json_utils.dart';
part 'character_icon_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
final class CharacterIconResponse with ToJsonMixin {
  const CharacterIconResponse({
    required this.height,
    required this.url,
    required this.width,
  });
  final String height;
  @JsonKey(
    name: 'URL',
    readValue: _readUrl,
  )
  final Uri? url;
  @JsonKey(readValue: readDouble)
  final double? width;

  factory CharacterIconResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterIconResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CharacterIconResponseToJson(this);
}

String? _readUrl(Map<dynamic, dynamic> rawJson, String key) {
  var value = rawJson[key];
  return switch (value) {
    String() when value.isNotEmpty => 'https://duckduckgo.com$value',
    _ => null,
  };
}
