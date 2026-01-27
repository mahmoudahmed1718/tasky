import 'package:flutter/material.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import '../../core/app_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logo", style: Styels.textStyle24),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.person, size: 24)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, size: 24),
              ),
              IconButton(
                onPressed: () async {
                  NotificationUtil.openDialog(
                    AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text('Logout'),
                          onPressed: () {
                            AppStorage.to.clearToken();
                            AuthFeature.to.go();
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.logout, size: 24, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// IconButton(
//             icon: const Icon(Icons.language),
//             onPressed: () {
//               if (getIt.get<AppStorage>().getLocale() == 'ar') {
//                 getIt.get<AppStorage>().setLocale('en');
//               } else {
//                 getIt.get<AppStorage>().setLocale('ar');
//               }
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               getIt.get<AppStorage>().getThemeMode() == ThemeMode.light
//                   ? Icons.dark_mode
//                   : Icons.light_mode,
//             ),
//             onPressed: () {
//               if (getIt.get<AppStorage>().getThemeMode() == ThemeMode.light) {
//                 getIt.get<AppStorage>().setThemeMode(ThemeMode.dark);
//               } else {
//                 getIt.get<AppStorage>().setThemeMode(ThemeMode.light);
//               }
//               setState(() {});
//             },
//           ),