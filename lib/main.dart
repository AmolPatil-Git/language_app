// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// mixin AppLocale {
//   static const String title = 'title';
//   static const String thisIs = 'thisIs';
//
//   static const Map<String, dynamic> EN = {
//     title: 'English',
//     thisIs: 'English',
//   };
//   static const Map<String, dynamic> HI = {
//     title: 'हिंदी',
//     thisIs: 'हिंदी',
//   };
//   static const Map<String, dynamic> MR = {
//     title: 'मराठी',
//     thisIs: 'मराठी',
//   };
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;
//
//   @override
//   void initState() {
//     _localization.init(
//       mapLocales: [
//         const MapLocale(
//           'en',
//           AppLocale.EN,
//           countryCode: 'US',
//           //fontFamily: 'Font EN',
//         ),
//         const MapLocale(
//           'hi',
//           AppLocale.HI,
//           countryCode: 'IN',
//          // fontFamily: 'Font KM',
//         ),
//         const MapLocale(
//           'mr',
//           AppLocale.MR,
//           countryCode: 'IN',
//         //  fontFamily: 'Font JA',
//         ),
//       ],
//       initLanguageCode: 'en',
//     );
//     _localization.onTranslatedLanguage = _onTranslatedLanguage;
//     super.initState();
//   }
//
//   void _onTranslatedLanguage(Locale? locale) {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       supportedLocales: _localization.supportedLocales,
//       localizationsDelegates: _localization.localizationsDelegates,
//       home: const SettingsScreen(),
//       theme: ThemeData(fontFamily: _localization.fontFamily),
//     );
//   }
// }
//
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(AppLocale.title.getString(context))),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('English'),
//                     onPressed: () {
//                       _localization.translate('en');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('हिंदी'),
//                     onPressed: () {
//                       _localization.translate('hi');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('मराठी'),
//                     onPressed: () {
//                       _localization.translate('mr', save: true);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             ItemWidget(
//               title: 'Current Language',
//               content: _localization.getLanguageName(),
//             ),
//
//             ItemWidget(
//               title: 'Context Format String',
//               content: context.formatString(
//                 AppLocale.thisIs,
//                 [AppLocale.title],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ItemWidget extends StatelessWidget {
//   const ItemWidget({
//     super.key,
//     required this.title,
//     required this.content,
//   });
//
//   final String? title;
//   final String? content;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(child: Text(title ?? '')),
//           const Text(' : '),
//           Expanded(child: Text(content ?? '')),
//         ],
//       ),
//     );
//   }
// }


// ?????????????????????????????????


import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:language_app/setting_screen.dart';

import 'app_locale.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _initializeLocalization();
    super.initState();
  }

  void _initializeLocalization() {
    try {
      _localization.init(
        mapLocales: [
          const MapLocale(
            'en',
            AppLocale.EN,
            countryCode: 'US',
          ),
          const MapLocale(
            'hi',
            AppLocale.HI,
            countryCode: 'IN',
          ),
          const MapLocale(
            'mr',
            AppLocale.MR,
            countryCode: 'IN',
          ),
        ],
        initLanguageCode: 'en',
      );
      _localization.onTranslatedLanguage = _onTranslatedLanguage;
    } catch (e) {
      print('Localization initialization failed: $e');
    }
  }

  void _onTranslatedLanguage(Locale? locale) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: const Homeview(),
      theme: ThemeData(fontFamily: _localization.fontFamily),
    );
  }
}

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
      children: [
        SizedBox(height: 150,),


        SizedBox(
          width: 250,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.translate),
                SizedBox(width: 20,),
                const Text('Change Language'),
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen(),));

            },
          ),
        ),
        SizedBox(height: 50,),
        Text(AppLocale.title.getString(context)),
        SizedBox(height: 20,),
        Text(AppLocale.thisIs.getString(context)),
      ],
    )));
  }
}


