import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  FoodPage({super.key, required this.food}) {
    /// Initialize selected addon to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  /// method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {


    /// close the current food page to go to menu
    Navigator.pop(context);

    /// format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    /// add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// Food Image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      /// Food Price
                      Text(
                        "Ksh.${widget.food.price}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(height: 10),

                      /// Food Description
                      Text(
                        widget.food.description,
                      ),

                      const SizedBox(height: 10),

                      Divider(color: Theme.of(context).colorScheme.secondary),

                      const SizedBox(height: 10),

                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      /// Addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            /// get individual addon
                            Addon addon = widget.food.availableAddons[index];

                            /// return check box UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                "Ksh.${addon.price}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                /// button -> Add to cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: 'Add to cart',
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        /// Back button
        SafeArea(
          child: Opacity(
            opacity: 0.9,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
        )
      ],
    );
  }
}
