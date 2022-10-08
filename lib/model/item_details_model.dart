import 'package:learning_course/gen/assets.gen.dart';
import 'package:learning_course/model/comment_model.dart';
import 'package:learning_course/view/screens/item_details/comment.dart';

class ItemDetailsModel {
  final String title;
  final List<String> images;
  final List<String> authors;
  final List<String> dependencies;
  final String level;
  final double rate;
  final int price;
  final String time;
  final String shoar;
  final String description;
  final List<CommentModel> comments;

  ItemDetailsModel({
    required this.title,
    required this.images,
    required this.authors,
    required this.dependencies,
    required this.level,
    required this.rate,
    required this.price,
    required this.time,
    required this.shoar,
    required this.description,
    required this.comments,
  });
}

final ItemDetailsModel itemDetails = ItemDetailsModel(
    title: "صفر تا صد فلاتر در یک روز",
    images: [
      Assets.images.testpic1.path,
      Assets.images.testpic2.path,
      Assets.images.testpic3.path,
      Assets.images.testpic1.path,
    ],
    authors: ["ساسان صفری","عباس عباسی"],
    dependencies: ["دارت","جاوا","پایتون"],
    level: "پیشرفته",
    rate: 4.8,
    price: 100000,
    time: "50:45:20",
    shoar: "خیلی خوبیم ما خیلیییییی",
    description: "فلاتر یکی از فریم‌ورک‌های بسیار جذابی است که می‌توانید از آن برای توسعه اپلیکیشن‌های مختلف استفاده کنید. این فریم‌ورک قابلیت‌های مختلفی را به شما ارائه می‌دهد که بدون شک آشنایی با این قابلیت‌ها می‌تواند برای توسعه‌دهندگان اپلیکیشن بسیار مفید و  همین شرکت نیز پشتیبانی می‌شود. به همین علت نیز شما می‌توانید نسبت به پشتیبانی از ویژگی‌های جدید در این فریم‌ورک کاملا مطمئن باشید و با خیالی راحت از آن استفاده کنید. صفر تا",
    comments: fakeComments
);
