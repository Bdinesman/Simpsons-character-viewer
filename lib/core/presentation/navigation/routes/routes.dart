import 'package:go_router/go_router.dart';
import 'package:simpsonsviewer/core/presentation/navigation/routes/character_routes.dart';

//In an enterprise application, an Authentication Bloc would listen here and
//redirect the user once they were logged out
final routes = [
  ShellRoute(
    builder: (context, state, child) => child,
    routes: [
      SearchCharatersRoute(
        routes: [
          CharacterDetailsRoute(),
        ],
      )
    ],
  ),
];
