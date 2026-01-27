import 'package:flutter/material.dart';
import 'package:tasky/features/profile/widgets/profile_card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: [ProfileItemCard(label: "mahmoud", value: "mahmoud")],
      ),
    );
  }
}
