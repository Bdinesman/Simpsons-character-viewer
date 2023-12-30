import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:simpsonsviewer/core/presentation/navigation/routes/character_routes.dart';
import 'package:simpsonsviewer/core/presentation/navigation/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simpsonsviewer/core/utils/localization_utils.dart';

class SimpsonsCharacterViewer extends StatefulWidget {
  const SimpsonsCharacterViewer({super.key});

  @override
  State<SimpsonsCharacterViewer> createState() =>
      _SimpsonsCharacterViewerState();
}

class _SimpsonsCharacterViewerState extends State<SimpsonsCharacterViewer> {
  final _routeConfig = GoRouter(
    initialLocation: SearchCharatersRoute.routePath,
    routes: routes,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.appLocalizations.appTitle,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff81c1)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFff81c1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: _routeConfig,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
    );
  }
}
