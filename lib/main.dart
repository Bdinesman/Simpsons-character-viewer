import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simpsonsviewer/core/presentation/widgets/simpsons_character_viewer.dart';
import 'package:simpsonsviewer/features/characters/data/clients/characters_client.dart';
import 'package:simpsonsviewer/features/characters/data/services/api_services/characters_api_service.dart';
import 'package:simpsonsviewer/features/characters/data/services/characters_service.dart';
import 'package:simpsonsviewer/features/characters/domain/repositories/characters_repository.dart';
import 'package:simpsonsviewer/features/search_characters/data/services/search_characters_service.dart';

void main() {
  _loadDependencies();
  runApp(const SimpsonsCharacterViewer());
}

void _loadDependencies() {
  var getIt = GetIt.I;
  getIt
    ..registerLazySingleton(
      () => CharactersClient(Dio()),
    )
    ..registerLazySingleton(
      () => CharactersApiService(
        charactersClient: getIt.get(),
      ),
    )
    ..registerLazySingleton(
      () => CharactersService(
        charactersApiService: getIt.get(),
      ),
    )
    ..registerLazySingleton(
      () => CharactersRepository(
        charactersService: getIt.get(),
      ),
    )
    ..registerLazySingleton(
      () => SearchCharactersService(
        charactersRepository: getIt.get(),
      ),
    );
}
