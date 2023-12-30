// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailsData _$CharacterDetailsDataFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailsData(
      name: json['name'] as String,
      description: json['description'] as String,
      iconSrc:
          json['iconSrc'] == null ? null : Uri.parse(json['iconSrc'] as String),
    );

Map<String, dynamic> _$CharacterDetailsDataToJson(
        CharacterDetailsData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'iconSrc': instance.iconSrc?.toString(),
    };
