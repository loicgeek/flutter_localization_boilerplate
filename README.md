# flutter_localization_boilerplate
<video src="https://www.facebook.com/loicgeek90/videos/2576796032591340/">

A couple of days ago, I was adding localization feature to an app, as I would not like to use any plugin , I wrote it from scratch as usage. So whenever i want to add localization, i write it from scratch and that is repetitive.So i have created this boilerplate to whenever i want to start a new app, I will just clone it and the localizations will be ready to use.

## How it works ?

This boilerplate let use change the app language whereever you want, but for that, the app must be notified. so I have used the bloc and flutter bloc to manage the language app state. You are free to add your state management library after without problem.
It load locale files in the folder /assets/locale/, so whenever you would like to add a new language , just duplicate one and rename with the corresponding language code.

## How to use ?
<ul>
  <li>Add supported locales in the main.dart file and initialize the translation

```
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
```
 </li>
    <li>Add you strings to your translation file,here is how my locale_en.json file looks like.

```
  {
    "pageNames": {
        "home": "Home",
        "settings": "Settings"
    },
    "pages": {
        "settings": {
            "general": "General",
            "language": "Language"
        },
        "home": {
            "label_times": "You have pushed the button this many times:",
            "welcome": "Welcome {{lastname}} {{name}}"
        }
    }
}
```
 </li>
  <li>Import the global translation file in the file you want to use.

```
  import 'package:flutter_localization/translation/global_translation.dart';
```
 </li>
 
  <li>That will export a translations variable on that you will call the text method to get the translation

```
  Text( translations.text('pages.home.label_times'),),
```
 </li>

</ul>

## Passing parameters to translated text
Sometimes , you might want to pass parameter to the translated text,cause the order of appartion of variable may difeers depending the language:

```
Text(translations.text('pages.home.welcome', params: {"name": "loic", 'lastname': "ngou"}), ),

```

That will replace the parameters name and lastname into the translated string .


- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
