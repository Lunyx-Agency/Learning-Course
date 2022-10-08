
import 'package:flutter/material.dart';
import 'package:learning_course/constants/constants.dart';
import 'package:learning_course/model/course_item_model.dart';

import '../../components/components.dart';
import 'card_item_vertical.dart';

class ItemVerticalList extends StatelessWidget {
  final String title;
  const ItemVerticalList({required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, title),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(bodyMargin, index==0 ? 32 : bodyMargin/2, bodyMargin, bodyMargin/2),
              child: CardItemVertical(item: fakeCourseItems[index],),
            );
          },
          itemCount: fakeCourseItems.length,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

}





