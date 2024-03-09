import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // shoe list
  final List<Shoe> _shoes = const [
    Shoe(
      shoeName: 'Nike 1',
      shoeImgPath: 'assets/1.png',
      shoePrice: 5000,
      shoeDescription:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          ''',
    ),
    Shoe(
      shoeName: 'Nike 2',
      shoeImgPath: 'assets/2.png',
      shoePrice: 7000,
      shoeDescription:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          ''',
    ),
    Shoe(
      shoeName: 'Nike 3',
      shoeImgPath: 'assets/3.jpg',
      shoePrice: 10000,
      shoeDescription:
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          ''',
    ),
  ];
  // get shoe list
  List<Shoe> get shoes => _shoes;

  // cart
  final List<Shoe> _cart = [];

  // get cart
  List<Shoe> get cart => _cart;

  // add item to cart
  void addItemToCart(Shoe shoe) {
    _cart.add(shoe);
    notifyListeners();
  }

  // delete item from cart
  void deleteItemFromCart(Shoe shoe) {
    _cart.remove(shoe);
    notifyListeners();
  }
}
