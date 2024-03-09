import 'package:flutter/material.dart';
import 'package:minimal_shop/components/cart_item.dart';
import 'package:minimal_shop/models/cart.dart';
import 'package:minimal_shop/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void deleteCartItem(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cart Page',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    var cartItem = value.cart[index];
                    return CartItem(
                      cartItem: cartItem,
                      onPressed: () => deleteCartItem(cartItem),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
