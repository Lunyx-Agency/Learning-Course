import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_course/view/screens/item_details/item_details_screen.dart';

import '../../../constants/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/course_item_model.dart';
import '../../components/components.dart';

class CardItemVertical extends StatelessWidget {
  final CourseItemModel item;
  const CardItemVertical({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Get.textTheme.bodyText2?.copyWith(fontSize: 12);
    return Container(
      height: Get.height/ 7,
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
            padding: const EdgeInsets.fromLTRB(6, 6, 16, 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(item.title,style: Get.textTheme.bodyText1?.copyWith(color: primaryTextColor.withOpacity(0.7)),overflow: TextOverflow.ellipsis,maxLines: 2,),
                      Row(children: [
                        Icon(EvaIcons.personOutline,size: 14,color: secondaryTextColor,),
                        const SizedBox(width: 4,),
                        Text(item.provider,style: textTheme,),
                      ],),
                      const SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1000 تومان',style: textTheme?.copyWith(color: secondaryColor),),
                          Row(
                            children: [
                              Text('5k',style: textTheme,),
                              const SizedBox(width: 4,),
                              Icon(EvaIcons.eyeOutline,size: 14,color: secondaryTextColor,),
                            ],
                          ),
                          Row(
                            children: [
                              Text('4.8',style: textTheme,),
                              const SizedBox(width: 4,),
                              Image(image: AssetImage(Assets.icons.star.path),width: 12,height: 12,),
                            ],
                          ),

                        ],),
                    ],
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(image: AssetImage(item.coverImage),fit: BoxFit.cover,),
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