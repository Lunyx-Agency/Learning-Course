class CommentModel {
  String name;
  String comment;
  DateTime dateTime;

  CommentModel({
    required this.name,
    required this.comment,
    required this.dateTime,
  });
}

List<CommentModel> fakeComments = [
  CommentModel(name: 'عباس', comment: 'خیلی خوب بود بسیار عالی', dateTime: DateTime.now()),
  CommentModel(name: 'دوست عباس', comment: 'بله که خوب بود', dateTime: DateTime.now()),
  CommentModel(name: 'قلی', comment: 'راضی نیستم'*10, dateTime: DateTime.now()),
  CommentModel(name: 'قاسم', comment: 'به به چه چه', dateTime: DateTime.now()),
  CommentModel(name: 'عباس', comment: 'خیلی خوب بود بسیار عالی', dateTime: DateTime.now()),
  CommentModel(name: 'دوست عباس', comment: 'بله که خوب بود', dateTime: DateTime.now()),
  CommentModel(name: 'قلی', comment: 'راضی نیستم', dateTime: DateTime.now()),
  CommentModel(name: 'قاسم', comment: 'به به چه چه', dateTime: DateTime.now()),
  CommentModel(name: 'عباس', comment: 'خیلی خوب بود بسیار عالی', dateTime: DateTime.now()),
  CommentModel(name: 'دوست عباس', comment: 'بله که خوب بود', dateTime: DateTime.now()),
  CommentModel(name: 'قلی', comment: 'راضی نیستم', dateTime: DateTime.now()),
  CommentModel(name: 'قاسم', comment: 'به به چه چه'*20, dateTime: DateTime.now()),

];
