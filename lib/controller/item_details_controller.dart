import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/comment_model.dart';

class ItemDetailsController extends GetxController{
  RxBool expand = false.obs;
  RxBool showComments = false.obs;
  RxBool showAllComments = false.obs;
  var expandableController = ExpandableController();
  var textEditController = TextEditingController();
  RxString commentTextField = "".obs;
  RxBool errorTextFeild = false.obs;



  changeExpand(){
    expand.value = !expand.value;
    expandableController.expanded = expand.value;
  }
  updateShowComments(){
    showComments.value = !showComments.value;
  }
  updateShowAllComments(){
    showAllComments.value = !showAllComments.value;
  }
  int commentsLengthToggle(){
    int lessCmdLength = 5;
    int commentLength = fakeComments.length;
    if(showAllComments.value){
      return commentLength;
    }else{
     if(commentLength < lessCmdLength){
       return commentLength;
     }else{
       return lessCmdLength;
     }
    }
  }
  updateEditTextComment(String str){
    commentTextField.value = str;
    errorTextFeild.value = false;
  }
  clearCommentText(){
    commentTextField.value = "";
    textEditController.text = "";
  }
}