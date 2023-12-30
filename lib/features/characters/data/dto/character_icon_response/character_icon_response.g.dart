// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_icon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterIconResponse _$CharacterIconResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterIconResponse(
      height: json['Height'] as String,
      url: _readUrl(json, 'URL') == null
          ? null
          : Uri.parse(_readUrl(json, 'URL') as String),
      width: (readDouble(json, 'Width') as num?)?.toDouble(),
    );

Map<String, dynamic> _$CharacterIconResponseToJson(
        CharacterIconResponse instance) =>
    <String, dynamic>{
      'Height': instance.height,
      'URL': instance.url?.toString(),
      'Width': instance.width,
    };
