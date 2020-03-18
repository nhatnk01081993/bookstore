class Book {
  final int id;
  final String name;
  final DateTime createdAt;
  final String thumbnail;
  final int chapter;

  Book({this.id, this.name, this.createdAt, this.thumbnail, this.chapter});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      thumbnail: json['thumbnail'],
      chapter: json['chapter'],
    );
  }
}
