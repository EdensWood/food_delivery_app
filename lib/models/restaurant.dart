import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burgers
    Food(
        name: "The Whooper",
        description:
            "Flamed-grilled beef, crisp lettuce, ripe tomatoes, pickles, mayo -- savory satisfaction with every bite, ",
        imagePath: "lib/food images/burgers/whooper burger.png",
        price: 720,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "Extra sauce", price: 50),
          Addon(name: "Extra pickles", price: 50),
        ]),
    Food(
        name: "Double Whooper",
        description:
            "Double the flame-grilled beef, double the satisfaction, nestled between toasted sesame seed buns—pure indulgence in every bite. ",
        imagePath: "lib/food images/burgers/double whooper burger.png",
        price: 870,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "Extra sauce", price: 50),
          Addon(name: "Extra pickles", price: 50),
        ]),
    Food(
        name: "Worcestershire burger",
        description:
            "A savory blend of flame-grilled beef infused with Worcestershire sauce, topped with tangy cheese and crisp lettuce",
        imagePath: "lib/food images/burgers/cheeseburger.jpeg",
        price: 900,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "Extra sauce", price: 50),
          Addon(name: "Extra pickles", price: 50),
        ]),
    Food(
        name: "Double bacon cheeseburger",
        description:
            "Two juicy beef patties, crispy bacon strips, melted cheese, lettuce, tomato, all nestled between toasted buns—decadent delight.",
        imagePath: "lib/food images/burgers/double bacon cheeseburger.jpeg",
        price: 900,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "Extra sauce", price: 50),
          Addon(name: "Extra pickles", price: 50),
        ]),
    Food(
        name: "Big King burger XL",
        description:
            "The Big King XL has four grilled burgers with triple cheese on them, bacon, sliced onions, lettuce, pickles and BIG King sauce",
        imagePath: "lib/food images/burgers/big king xl.png",
        price: 1200,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "Extra sauce", price: 50),
          Addon(name: "Extra pickles", price: 50),
        ]),

    // desserts
    Food(
        name: "Ice cream",
        description:
            "Indulge in a symphony of flavors with creamy vanilla, rich chocolate, and luscious strawberry, a delightful frozen trio.",
        imagePath: "lib/food images/desserts/ice cream.jpeg",
        price: 100,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Vanilla flavor", price: 100),
          Addon(name: "Strawberry flavor", price: 100),
        ]),
    Food(
        name: "Cake",
        description:
            "Savor the sweetness of cake—a delectable confection, moist layers adorned with creamy frosting, a heavenly treat for any occasion.",
        imagePath: "lib/food images/desserts/cake.jpeg",
        price: 250,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "More Strawberry", price: 150),
        ]),
    // drinks
    Food(
        name: "Coca cola",
        description:
            "A timeless fizzy elixir, blending caramel sweetness with a refreshing kick, igniting taste buds worldwide since 1886.",
        imagePath: "lib/food images/drinks/coke.jpg",
        price: 250,
        category: FoodCategory.drinks,
        availableAddons: []),
    Food(
        name: "Fanta Orange",
        description:
            "Zesty sunshine in a sip, bursting with citrus tang, effervescent joy in every drop, a fruity fizzy delight.",
        imagePath: "lib/food images/drinks/orange.jpg",
        price: 250,
        category: FoodCategory.drinks,
        availableAddons: []),
    Food(
        name: "Fanta blackcurrant",
        description:
            "Darkly delicious, a symphony of rich berry notes, fizzy allure, and refreshing sweetness, a tantalizing taste adventure awaits.",
        imagePath: "lib/food images/drinks/blackcurrant.jpeg",
        price: 250,
        category: FoodCategory.drinks,
        availableAddons: []),
    // fries
    Food(
        name: "Crispy Fries",
        description:
            "Golden perfection, crunchy exterior, fluffy interior, sprinkled with salt, a timeless comfort, satisfying cravings with each savory bite..",
        imagePath: "lib/food images/fries/crispy fries.jpeg",
        price: 150,
        category: FoodCategory.fries,
        availableAddons: [
          Addon(name: "Sriracha Drizzle", price: 10),
          Addon(name: "Kachumbari", price: 0),
        ]),
    Food(
        name: "Normal Fries",
        description:
            "Golden perfection, crunchy exterior, fluffy interior, sprinkled with salt, a timeless comfort, satisfying cravings with each savory bite..",
        imagePath: "lib/food images/fries/fries.jpeg",
        price: 120,
        category: FoodCategory.fries,
        availableAddons: [
          Addon(name: "Sriracha Drizzle", price: 10),
          Addon(name: "Kachumbari", price: 0),
          Addon(name: "Tomato Sauce Sachet", price: 5),
        ]),
    Food(
        name: "Masala Fries",
        description:
            "Spicy sensation, crispy potato strips infused with aromatic Indian spices, tantalizing taste buds with every flavorful bite.",
        imagePath: "lib/food images/fries/masala fries.jpeg",
        price: 200,
        category: FoodCategory.fries,
        availableAddons: [
          Addon(name: "Extra Spice", price: 20),
          Addon(name: "Kachumbari", price: 0),
          Addon(name: "Tomato Sauce Sachet", price: 5),
        ]),
  ];

  // delivery address (which user can change/update)
  String _deliveryAddress = "Stellato Building Top Floor";

  /// G E T T E R S
  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  /// user cart
  final List<CartItem> _cart = [];

  /// O P E R A T I O N S

  /// Add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    /// see if there is a cart item already with the same food and selected addon
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      /// check if the food items are the same
      bool isSameFood = item.food == food;

      /// check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    /// if item already exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    /// otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  /// Remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  /// get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  /// get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  /// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  ///update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /// H E L P E R S

  /// generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------------");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  /// Format double value into money
  String _formatPrice(double price) {
    return "Ksh.${price.toStringAsFixed(2)}";
  }

  /// format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
