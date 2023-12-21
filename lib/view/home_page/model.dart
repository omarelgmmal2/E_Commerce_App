class FeaturedModel{
  final String image,text;
  final double price;

  FeaturedModel
      ({
    required this.image,
    required this.text,
    required this.price
      });
}


class ItemModel{
  final String image,text;
  final double price;

  ItemModel
      ({
    required this.image,
    required this.text,
    required this.price
  });
}


class CategorieModel{
  final String image;

  CategorieModel({required this.image});
}