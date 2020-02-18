import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/screens/homepage.dart';
import 'package:flutter_localization/screens/settings.dart';
import 'package:flutter_localization/translation/bloc/translation_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'translation/global_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Initialization of the translations based on supported language
  /// and the  fallback language (Optional)
  ///
  List<String> supportedLanguages = ["en", "fr", "hi", "zh", "ru"];
  await translations.init(supportedLanguages, fallbackLanguage: 'en');

  return runApp(BlocProvider(
    create: (context) => TranslationBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// I'm using the Translation bloc here to provide the selected language whenever it changes
    /// But after that , you are free to not use Bloc pattern at all
    /// @Required
    return BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
      return MaterialApp(
        locale: state.locale ?? translations.locale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: translations.supportedLocales(),
        title: 'Flutter Demo Localization',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MyHomePage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return MyHomePage();
                },
              );
              break;
            case SettingsPage.routeName:
              return MaterialPageRoute(
                builder: (context) {
                  return SettingsPage();
                },
              );
              break;
            default:
              return MaterialPageRoute(
                builder: (context) {
                  return MyHomePage();
                },
              );
          }
        },
        home: MyHomePage(),
      );
    });
  }
}
