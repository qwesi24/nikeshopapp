import 'package:flutter/widgets.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom',
      price: '150', // Changed to int for numerical representation
      imagePath: 'lib/images/131266.jpg',
      description: 'The forward thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Air Jordans',
      price: '299',
      imagePath: 'lib/images/143820053_e60a8af2-d2be-419a-86e2-bb6088f40698.jpg',
      description: 'Latest signature shoe.',
    ),
    Shoe(
      name: 'KD Treys',
      price: '399',
      imagePath: 'lib/images/143820053_e60a8af2-d2be-419a-86e2-bb6088f40698.psd',
      description: 'I run out of words.',
    ),
    Shoe(
      name: 'NPP Shoe',
      price: '499',
      imagePath: 'lib/images/2151005661.jpg',
      description: 'Still running out of words.',
    ),
    Shoe(
      name: 'NPP Shoe',
      price: '499',
      imagePath: 'lib/images/sports-shoe-pair-design-illustration-generated-by-ai.jpg',
      description: 'Still running out of words.',
    ),
  ];

  // List of items in user cart
  List<Shoe> userCart = [];

  // Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
