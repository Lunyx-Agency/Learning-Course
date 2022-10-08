import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class ItemIconAndTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final int contentMaxLine;

  const ItemIconAndTitle({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
    this.contentMaxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: secondaryColor,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: Get.textTheme.bodyText2
              ?.copyWith(color: secondaryColor, fontSize: 13),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: contentMaxLine,
            style: Get.textTheme.bodyText2
                ?.copyWith(color: const Color(0xFF5E5E5E), fontSize: 12),
          ),
        ),
      ],
    );
  }
}