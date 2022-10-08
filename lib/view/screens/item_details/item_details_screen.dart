import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learning_course/constants/constants.dart';
import 'package:learning_course/controller/item_details_controller.dart';
import 'package:learning_course/model/comment_model.dart';
import 'package:learning_course/model/item_details_model.dart';
import 'package:learning_course/view/screens/item_details/comment.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';
import 'item_icon_and_title.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    var itemDetailsController = Get.put(ItemDetailsController());
    var item = itemDetails;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(pageController),
                Padding(
                  padding: EdgeInsets.all(bodyMargin),
                  child: Text(
                    item.title,
                    style: Get.textTheme.headline3,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                buildExpandablePanel(itemDetailsController),
                Center(
                  child: Obx(
                    () => IconButton(
                        onPressed: () {
                          itemDetailsController.changeExpand();
                        },
                        icon: Icon(
                          !itemDetailsController.expand.value
                              ? EvaIcons.arrowIosDownwardOutline
                              : EvaIcons.arrowIosUpwardOutline,
                          color: secondaryColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: bodyMargin,
                ),
                toggleDescriptionOrComments(itemDetailsController),
                Padding(
                  padding: EdgeInsets.all(bodyMargin),
                  child: Obx(
                    () => itemDetailsController.showComments.value
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'تعداد دیدگاه ها',
                                    style: TextStyle(
                                        fontSize: 11, color: Color(0xFF5E5E5E)),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(fakeComments.length.toString(),
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: secondaryColor)),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        itemDetailsController.errorTextFeild.value = false;
                                        bottomSheetCommentAndRate();
                                      },
                                      child: Text(
                                          'ایجاد دیدگاه | امتیاز دهی | ورود',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: primaryColor,
                                              fontWeight: FontWeight.normal)))
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              //rating bar
                              Row(
                                children: [
                                  const Text(
                                    'امتاز شما',
                                    style: TextStyle(
                                        fontSize: 11, color: Color(0xFF5E5E5E)),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  //TODO replace dynamic user rating with static initalRating
                                  RatingBar.builder(
                                    initialRating: 1,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    unratedColor:
                                        secondaryTextColor.withOpacity(0.6),
                                    itemBuilder: (context, _) => const Icon(
                                      EvaIcons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {},
                                    itemSize: 18,
                                    ignoreGestures: true,
                                  ),
                                ],
                              ),
                              //comments
                              commentsListView(itemDetailsController),
                              SizedBox(
                                height: bodyMargin,
                              ),
                              //show all comments
                              showAllCommentsToggle(itemDetailsController)
                            ],
                          )
                        : ExpandableText(
                            item.description,
                            expandText: "نمایش کامل",
                            collapseText: "نمایش کمتر",
                            maxLines: 3,
                            linkColor: primaryColor,
                          ),
                  ),
                ),
                SizedBox(
                  height: bodyMargin * 6,
                )
              ],
            ),
          ),
        ),
        //bottom buttons
        Positioned(
          bottom: bodyMargin,
          right: bodyMargin,
          left: bodyMargin,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('خرید دوره'))),
              ),
              SizedBox(
                width: bodyMargin,
              ),
              SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        EvaIcons.bookOpenOutline,
                        size: 32,
                      )))
            ],
          ),
        )
      ],
    ));
  }

  Future<dynamic> bottomSheetCommentAndRate() {
    var controller = Get.put(ItemDetailsController());
    return Get.bottomSheet(
      SizedBox(
        height: Get.height / 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, bodyMargin*2, bodyMargin, bodyMargin),
          child: Column(
            children: [
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(
                    horizontal: 2.0),
                unratedColor:
                secondaryTextColor.withOpacity(0.6),
                itemBuilder: (context, _) => const Icon(
                  EvaIcons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (double value) {},
                itemSize: 32,
              ),
              SizedBox(height: bodyMargin*2,),
              Row(
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
                  SizedBox(width: bodyMargin,),
                  Text(
                    "عباس",
                    style: TextStyle(
                        color: secondaryColor, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(height: bodyMargin,),
              Obx(
                ()=> TextField(
                  controller: controller.textEditController,
                  maxLines: null,
                  maxLength: maxTextFeildCommentLength,
                  style: Get.textTheme.bodyText2?.copyWith(color: const Color(0xFF878787)),
                  decoration: InputDecoration(
                      hintText: "دیگاه خودت رو بنویس",
                      prefixIcon: const Icon(EvaIcons.editOutline,color: Color(0xFF878787),),
                    hintStyle: Get.textTheme.bodyText2,
                    suffixIcon: controller.commentTextField.value.isNotEmpty ? InkWell(
                        onTap: (){controller.clearCommentText();},
                        child: Icon(EvaIcons.closeCircleOutline,color: secondaryColor,)) : const SizedBox.shrink(),
                      counterText: '${controller.commentTextField.value.length}/$maxTextFeildCommentLength',
                      errorText: controller.errorTextFeild.value ? 'فیلد مورد نظر را پر کنید' : null,

                  ),
                  onChanged: (val){
                    controller.updateEditTextComment(val);
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex:1,child: ElevatedButton(onPressed: (){
                      //TODO add comment and rating
                      if(controller.commentTextField.value.isEmpty){
                        controller.errorTextFeild.value = true;
                      }else{
                        var comment = CommentModel(name: 'عباس', comment: controller.commentTextField.value, dateTime: DateTime.now());
                        fakeComments.add(comment);
                        controller.clearCommentText();
                        Get.back();
                      }


                    }, child: const Text('ثبت'))),
                    SizedBox(width: bodyMargin,),
                    Expanded(
                        flex:1,
                        child: ElevatedButton(
                            onPressed: (){
                              controller.clearCommentText();
                              Get.back();
                            },
                          style: ElevatedButton.styleFrom(
                            primary: backgroundColor,
                            onPrimary: primaryColor,
                            elevation: 0,
                            side: BorderSide(color: primaryColor)
                          ), child: const Text('انصراف'),
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      barrierColor: bottomSheetBarrierColor,
      backgroundColor: bottomSheetBgColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      )),
    );
  }

  Obx commentsListView(ItemDetailsController itemDetailsController) {
    var item = itemDetails;
    return Obx(
      () => ListView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Comment(
              name: item.comments[index].name,
              comment: item.comments[index].comment,
              dateTime: item.comments[index].dateTime,
            ),
          );
        },
        itemCount: itemDetailsController.commentsLengthToggle(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Obx showAllCommentsToggle(ItemDetailsController itemDetailsController) {
    return Obx(
      () => InkWell(
        splashColor: primaryLightColor,
        highlightColor: primaryColor.withOpacity(0.2),
        onTap: () {
          itemDetailsController.updateShowAllComments();
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          // i use container and padding to consist bigger space for tap
          child: Column(
            children: [
              Text(
                !itemDetailsController.showAllComments.value
                    ? 'نمایش بیشتر دیدگاه ها'
                    : 'نمایش کمتر',
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor,
                ),
              ),
              Icon(
                itemDetailsController.showAllComments.value
                    ? EvaIcons.arrowIosUpward
                    : EvaIcons.arrowIosDownward,
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleDescriptionOrComments(
      ItemDetailsController itemDetailsController) {
    return Padding(
      padding: EdgeInsets.all(bodyMargin),
      child: Container(
        width: Get.width / 2,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: primaryLightColor,
        ),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      itemDetailsController.updateShowComments();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: itemDetailsController.showComments.value
                            ? primaryLightColor
                            : secondaryColor,
                      ),
                      child: Center(
                          child: Text(
                        'توضیحات',
                        style: TextStyle(
                            fontSize: 12,
                            color: itemDetailsController.showComments.value
                                ? secondaryColor
                                : Colors.white),
                      )),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      itemDetailsController.updateShowComments();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: itemDetailsController.showComments.value
                            ? secondaryColor
                            : primaryLightColor,
                      ),
                      child: Center(
                          child: Text(
                        'دیدگاه کاربران',
                        style: TextStyle(
                            fontSize: 12,
                            color: itemDetailsController.showComments.value
                                ? Colors.white
                                : secondaryColor),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  ExpandablePanel buildExpandablePanel(
      ItemDetailsController itemDetailsController) {
    var item = itemDetails;
    return ExpandablePanel(
      collapsed: Padding(
        padding: EdgeInsets.all(bodyMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.personOutline,
                        title: 'مدرسان',
                        content: item.authors.join(' , '))),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.starOutline,
                        title: 'امتیاز',
                        content: '${item.rate}/5')),
              ],
            ),
            SizedBox(
              height: bodyMargin,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.barChart2Outline,
                        title: 'سطح دوره',
                        content: item.level)),
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.pricetagsOutline,
                        title: 'قیمت',
                        content: '${item.price} تومان')),
              ],
            ),
          ],
        ),
      ),
      expanded: Padding(
        padding: EdgeInsets.all(bodyMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.barChart2Outline,
                        title: 'سطح دوره',
                        content: item.level)),
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.pricetagsOutline,
                        title: 'قیمت',
                        content: '${item.price} تومان')),
              ],
            ),
            SizedBox(
              height: bodyMargin,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.clockOutline,
                        title: 'مدت زمان',
                        content: item.time)),
                Expanded(
                    flex: 1,
                    child: ItemIconAndTitle(
                        icon: EvaIcons.starOutline,
                        title: 'امتیاز',
                        content: '${item.rate}/5')),
              ],
            ),
            SizedBox(
              height: bodyMargin,
            ),
            ItemIconAndTitle(
              icon: EvaIcons.personOutline,
              title: 'مدرسان',
              content: item.authors.join(' , '),
              contentMaxLine: 2,
            ),
            SizedBox(
              height: bodyMargin,
            ),
            ItemIconAndTitle(
              icon: EvaIcons.fileTextOutline,
              title: 'پیش نیازها',
              content: item.dependencies.join(' , '),
              contentMaxLine: 2,
            ),
            SizedBox(
              height: bodyMargin,
            ),
            ItemIconAndTitle(
              icon: EvaIcons.messageCircleOutline,
              title: 'شعار دوره',
              content: item.shoar,
              contentMaxLine: 2,
            ),
          ],
        ),
      ),
      controller: itemDetailsController.expandableController,
    );
  }

  SizedBox header(PageController pageController) {
    var item = itemDetails;
    return SizedBox(
      height: Get.height / 2.76,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Image(
                image: AssetImage(item.images[index]),
                fit: BoxFit.cover,
              );
            },
            itemCount: item.images.length,
          ),
          Positioned(
            bottom: bodyMargin,
            right: bodyMargin,
            child: SmoothPageIndicator(
              controller: pageController,
              count: item.images.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: secondaryColor,
                  dotColor: secondaryTextColor),
            ),
          ),
          //gradinet
          Positioned(
            top: 0,
            left: 0,
            right: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [secondaryColor.withOpacity(0.8),secondaryColor.withOpacity(0.6),Colors.transparent])
                ),
              )),
          Positioned(
            top: 48,
            right: 24,
            child: InkWell(
              highlightColor: secondaryColor,
              splashColor: primaryColor,
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryLightColor.withOpacity(0.8),
                ),
                child: Icon(
                  EvaIcons.arrowIosForwardOutline,
                  color: secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
