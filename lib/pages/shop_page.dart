import 'package:flutter/material.dart';
import 'package:minimal_shop/components/shoe_tile.dart';
import 'package:minimal_shop/models/cart.dart';
import 'package:minimal_shop/models/shoe.dart';

import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Add to Cart'),
        content: Text('Shoe added successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'everyone flies. some fly longer than others.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.shoes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var shoe = value.shoes[index];
                  return ShoeTile(
                    shoeName: shoe.shoeName,
                    shoeDescription: shoe.shoeDescription,
                    shoePrice: shoe.shoePrice,
                    shoeImgPath: shoe.shoeImgPath,
                    onTap: () => addShoeToCart(shoe),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
