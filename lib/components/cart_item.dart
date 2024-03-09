import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shoe.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
    required this.onPressed,
  });
  final Shoe cartItem;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: ListTile(
        leading: Image.asset(cartItem.shoeImgPath),
        title: Text(cartItem.shoeName),
        subtitle: Text(cartItem.shoePrice.toString()),
        trailing: IconButton(
          onPressed: onPressed,
          color: Colors.red[300],
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
