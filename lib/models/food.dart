///food item
class Food {
  final String name;            // cheese burger
  final String description;     // a burger full of cheese
  final String imagePath;       // lib/images/cheese_burger.png
  final double price;           // Ksh. 550
  final FoodCategory category;  // burger
  List<Addon> availableAddons;  //[ extra cheese, sauce]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

/// Food categories
enum FoodCategory {
  burgers,
  desserts,
  drinks,
  fries,
}

/// Food addons
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
