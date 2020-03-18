class Book {
  final int albumId;
  final String title;
  final String url;

  Book({this.albumId, this.title, this.url});
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
    );
  }
}
