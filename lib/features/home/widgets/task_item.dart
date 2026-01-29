import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/utils/styels.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final String priority;
  final String date;

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.date,
  });

  Color getStatusColor() {
    switch (status) {
      case "Waiting":
        return Colors.orange;
      case "Inprogress":
        return Colors.purple;
      case "Finished":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Color getPriorityColor() {
    switch (priority) {
      case "High":
        return Colors.red;
      case "Medium":
        return Colors.purple;
      case "Low":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shopping_cart, color: Colors.orange, size: 50),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Styels.textStyle16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: getStatusColor().withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(color: getStatusColor(), fontSize: 12),
                      ),
                    ),
                  ],
                ),

                const Gap(4),

                // Description
                Text(
                  description,
                  style: Styels.textStyle14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const Gap(6),

                // Priority + Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.flag, color: getPriorityColor(), size: 14),
                        const SizedBox(width: 6),
                        Text(
                          priority,
                          style: TextStyle(color: getPriorityColor()),
                        ),
                      ],
                    ),
                    Text(
                      date,
                      style: Styels.textStyle14.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(4),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minHeight: 0, minWidth: 0),
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
