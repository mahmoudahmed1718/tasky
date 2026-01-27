import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/arrow_back_widget.dart';
import 'package:tasky/features/profile/widgets/profile_card_widget.dart';
import 'package:tasky/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Styels.textStyle16),

        leading: Arrowbackwidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Gap(16),
            ProfileItemCard(label: 'Name', value: 'John Doe'),
            Gap(6),
            ProfileItemCard(
              label: 'Phone',
              value: '+201125144905',
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '+201125144905'));
                },
                icon: const Icon(
                  Icons.copy_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Gap(6),
            ProfileItemCard(label: 'Level', value: '2Dd9m@example.com'),
            Gap(6),
            ProfileItemCard(label: 'Years of Experience', value: '**********'),
            Gap(6),
            ProfileItemCard(label: 'Location', value: 'English'),
          ],
        ),
      ),
    );
  }
}
