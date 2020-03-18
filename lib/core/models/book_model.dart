class Book {
  final int id;
  final String name;
  final String avatar;

  Book({this.id, this.name, this.avatar});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
