class CategoryModel {
  int id;
  String title;

  CategoryModel({required this.id, required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], title: json['title']);
  }
}
