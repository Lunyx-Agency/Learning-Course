import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_course/view/screens/home/item_vertical_list.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/strings.dart';
import '../../../model/course_item_model.dart';
import 'card_item_horizontal.dart';

class CourseCategory extends StatelessWidget {
  final String catTitle;
  final List<CourseItemModel> mylist;
  final String iconPath;

  const CourseCategory({
    required this.catTitle,
    required this.mylist,
    required this.iconPath,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var textTheme = Get.textTheme;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMargin),
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  iconPath,
                ),
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                catTitle,
                style: textTheme.bodyText2?.copyWith(color: secondaryColor),
              ),
              const Spacer(),
              TextButton(
                onPressed: (){
                  Get.to(() => ItemVerticalList(title: catTitle,));
                }, child: Text(showMore, style: textTheme.bodyText2,),
              ),
            ],
          ),
        ),
        SizedBox(
          height: itemHorizontalHeight + 32,
          child: ListView.builder(itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.fromLTRB( index==mylist.length-1 ? 12 : 8, 4, index==0 ? 16 : 8, 16),
              child: CardItemHorizontal(item: mylist[index],),
            );
          },
            itemCount: mylist.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}