
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart( Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('Just added'),
          content: Text('check your fucking cart'),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: const Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          // Hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Hot kicks🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 9),

          // List of shoes for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.getShoeList().length, // Use Cart's shoe list
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Get the shoe from the list
                Shoe shoe = value.getShoeList() [index];

                return ShoeTile(
                  shoe: shoe,
                  onTap:() =>addShoeToCart(shoe) ,

                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
