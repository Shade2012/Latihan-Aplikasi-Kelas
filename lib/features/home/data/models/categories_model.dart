class CategoriesModel {
  final String name;
  final bool active;

  CategoriesModel({
    required this.name,
    required this.active,
  });
}

List categoriesData = [
  CategoriesModel(name: "Sen", active: true),
  CategoriesModel(name: "Sel", active: false),
  CategoriesModel(name: "Rab", active: false),
  CategoriesModel(name: "Kam", active: false),
  CategoriesModel(name: "Jum", active: false),
  CategoriesModel(name: "Sab", active: false),
];
