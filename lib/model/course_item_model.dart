class CourseItemModel{
  String title;
  String provider;
  String dependency;
  int price;
  String coverImage;

  CourseItemModel({
    required this.title,
    required this.provider,
    required this.dependency,
    required this.price,
    required this.coverImage,
  });

}

List<CourseItemModel> fakeCourseItems = [
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 900000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 800000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 700000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 600000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 500000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 400000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 300000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 200000, coverImage: ""),
  CourseItemModel(title: 'صفر تا صد فلاتر', provider: "ساسان صفری", dependency: "", price: 100000, coverImage: ""),
];