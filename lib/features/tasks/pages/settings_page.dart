import 'package:app_forms/app_forms.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/arrow_back_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Styels.textStyle16),
        leading: Arrowbackwidget(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FormBuilder(
              child: Column(
                children: [
                  //! Theme Switch
                  FormBuilderSwitch(
                    name: 'theme',
                    title: Text('Dark Mode', style: Styels.textStyle24),
                    initialValue:
                        AppStorage.to.getThemeMode() == ThemeMode.dark,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (val) {
                      final newTheme = (val == true)
                          ? ThemeMode.dark
                          : ThemeMode.light;
                      AppStorage.to.setThemeMode(newTheme);
                    },
                  ),
                  const Gap(6),
                  //! Language Switch
                  FormBuilderSwitch(
                    name: 'language',
                    title: Text('Arabic Language', style: Styels.textStyle24),
                    initialValue: AppStorage.to.getLocale() == 'ar',
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (val) {
                      final newLocale = (val == true) ? 'ar' : 'en';
                      AppStorage.to.setLocale(newLocale);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
