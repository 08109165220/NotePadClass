class Notess {
  int? id;
  String title;
  String categories;
  DateTime createdAt;

  Notess({
    this.id,
    required this.title,
    required this.categories,
    required this.createdAt,
  });
  Map<String,dynamic> toMap(){
    return {
     "title" :title,
     "categories" :categories,
     "createdAt" :createdAt.toString(),
    };
  }
}

// final List<Notess> notess = [];

