import 'package:app_features/app_features.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/features/auth/auth_feature.dart';
import 'package:tasky/features/home/tasks_feature.dart';
import 'package:tasky/features/home/widgets/choise_chip_widget.dart';
import 'package:tasky/features/home/widgets/task_item.dart';
import 'package:tasky/features/profile/bloc/profile_bloc.dart';
import 'package:tasky/features/profile/profile_feature.dart';
import '../../core/app_storage.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  State<TasksPage> createState() => _HomePageState();
}

class _HomePageState extends State<TasksPage> {
  final tabs = ['All', 'Inprogress', 'Waiting', 'Finished'];
  String selectedTab = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logo", style: Styels.textStyle24),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  await ProfileBloc.to.getProfile();
                  ProfileFeature.to.push();
                },
                icon: Icon(Icons.person, size: 24),
              ),
              IconButton(
                onPressed: () {
                  TasksFeature.to.goToSettingsPage();
                },
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
                          onPressed: () => AppFeatures.pop(),
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Tasks",
              style: Styels.textStyle16.copyWith(color: Colors.grey),
            ),
            Gap(8),
            Wrap(
              spacing: 6,
              children: tabs.map((tab) {
                final isSelected = selectedTab == tab;
                return ChoiceChipWidget(
                  title: tab,
                  onSelected: (tab) {},
                  selected: isSelected,
                );
              }).toList(),
            ),

            Gap(16),
            Expanded(
              child: ListView(
                children: [
                  TaskItem(
                    title: "Grocery Shopping",
                    description: "This application is designed for...",
                    status: "Waiting",
                    priority: "Medium",
                    date: "30/12/2022",
                  ),
                ],
              ),
            ),
          ],
        ),
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