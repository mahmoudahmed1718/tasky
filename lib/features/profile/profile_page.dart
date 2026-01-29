import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/utils/styels.dart';
import 'package:tasky/core/widgets/arrow_back_widget.dart';
import 'package:tasky/features/profile/bloc/profile_bloc.dart';
import 'package:tasky/features/profile/bloc/profile_state.dart';
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
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: ProfileBloc.to,
          builder: (context, state) {
            final profileModel = state.profileModel;
            return ListView(
              children: [
                Gap(16),
                ProfileItemCard(
                  label: 'Name',
                  value: profileModel?.displayName ?? '',
                ),
                Gap(6),
                ProfileItemCard(
                  label: 'Phone',
                  value: profileModel?.username ?? '',
                  trailing: IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: profileModel?.username ?? ''),
                      );
                    },
                    icon: const Icon(
                      Icons.copy_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Gap(6),
                ProfileItemCard(
                  label: 'Level',
                  value: profileModel?.level ?? '',
                ),
                Gap(6),
                ProfileItemCard(
                  label: 'Years of Experience',
                  value: profileModel?.experienceYears.toString() ?? '',
                ),
                Gap(6),
                ProfileItemCard(
                  label: 'Location',
                  value: profileModel?.address ?? '',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
