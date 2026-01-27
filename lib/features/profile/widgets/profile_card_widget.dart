import 'package:flutter/material.dart';
import 'package:tasky/core/utils/styels.dart';

class ProfileItemCard extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const ProfileItemCard({
    super.key,
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: Styels.textStyle14.copyWith(
                    color: Colors.black.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: Styels.textStyle24.copyWith(
                    color: Colors.black.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
