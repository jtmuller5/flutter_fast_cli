import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';
import 'settings_view_model.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            children: [
              ValueListenableBuilder(
                  valueListenable: settingsService.themeMode,
                  builder: (context, mode, child) {
                    return Column(
                      children: [
                        RadioListTile<ThemeMode>(
                          title: const Text('Light'),
                          value: ThemeMode.light,
                          groupValue: mode,
                          onChanged: (value) {
                            settingsService.setThemeMode(value.toString());
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          title: const Text('Dark'),
                          value: ThemeMode.dark,
                          groupValue: mode,
                          onChanged: (value) {
                            settingsService.setThemeMode(value.toString());
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          title: const Text('System'),
                          value: ThemeMode.system,
                          groupValue: mode,
                          onChanged: (value) {
                            settingsService.setThemeMode(value.toString());
                          },
                        ),
                      ],
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
