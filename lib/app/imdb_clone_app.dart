import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imdb_clone/app/navigation/app_router_config.dart';
import 'package:imdb_localization/strings.g.dart';

class IMDBCloneApp extends StatefulWidget {
  const IMDBCloneApp({super.key});

  @override
  State<IMDBCloneApp> createState() => _IMDBCloneAppState();
}

class _IMDBCloneAppState extends State<IMDBCloneApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
