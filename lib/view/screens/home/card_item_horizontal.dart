import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_course/model/course_item_model.dart';
import 'package:learning_course/view/components/components.dart';
import 'package:learning_course/view/screens/item_details/item_details_screen.dart';

import '../../../constants/colors.dart';

class CardItemHorizontal extends StatelessWidget {
  final CourseItemModel item;
  const CardItemHorizontal({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Get.textTheme.bodyText1
        ?.copyWith(fontSize: 8, color: secondaryTextColor);

    return Container(
      width: Get.width / 2,
      height: Get.height / 5.5,
      decoration: itemDecoration,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: primaryColor,
          highlightColor: primaryLightColor,
          borderRadius: BorderRadius.circular(20),
          onTap: (){
            Get.to(()=> const ItemDetailsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: Get.height / 8.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage(item.coverImage),fit: BoxFit.cover),
                    color: primaryLightColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                        item.title,
                        style: myTextStyle?.copyWith(
                            fontSize: 10, color: primaryTextColor),
                      ),
                      const Spacer(),
                      Text(
                        '5k',
                        style: myTextStyle,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        EvaIcons.eyeOutline,
                        color: secondaryTextColor,
                        size: 12,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        EvaIcons.personOutline,
                        color: secondaryTextColor,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        item.provider,
                        style: myTextStyle,
                      ),
                      const Spacer(),
                      Text(
                        '${item.price} تومان',
                        style: myTextStyle?.copyWith(color: secondaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}