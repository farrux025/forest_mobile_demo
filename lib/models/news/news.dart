class NewsModel {
  String title;
  String? description;
  String date;
  String? image;
  bool isRead;

  NewsModel(
      {required this.title,
      required this.date,
      required this.isRead,
      this.image,
      this.description});
}
