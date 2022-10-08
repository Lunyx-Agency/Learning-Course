import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_course/tools/tools.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';

class Comment extends StatelessWidget {
  final String name;
  final String comment;
  final DateTime dateTime;
  const Comment({
    Key? key, required this.name, required this.comment, required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Jalali jalali = Jalali.fromDateTime(dateTime);


    return Container(
      padding: const EdgeInsets.fromLTRB(8,8,8,16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle),
            child: const Icon(
              EvaIcons.personOutline,
              color: Color(0xFF8E8E8E),
              size: 16,
            ),
          ),
          SizedBox(
            width: bodyMargin,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Tools.shamsiFormat(jalali),
                    style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 10),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: secondaryColor, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4,),
                Text(
                  comment,
                  style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}