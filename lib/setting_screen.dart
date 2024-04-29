import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'app_locale.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization _localization = FlutterLocalization.instance;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocale.title.getString(context))),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child:
                  const Text('English'),
                  onPressed: () {
                    _localization.translate('en', save: true);
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: const Text('हिंदी'),
                  onPressed: () {
                    _localization.translate('hi', save: true);
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: const Text('मराठी'),
                  onPressed: () {
                    _localization.translate('mr', save: true);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),


            Text(AppLocale.title.getString(context)),
            Text(AppLocale.thisIs.getString(context)),
          ],
        ),
      ),
    );
  }
}


