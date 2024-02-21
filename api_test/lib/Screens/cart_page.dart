import 'package:flutter/material.dart';
import 'package:api_test/Screens/home_page.dart';

class CartPage extends StatefulWidget {
  final List<myModel> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];
          return ListTile(
            title: Text(cartItem.title ?? ''),
            subtitle: Text(
                '\$${cartItem.price?.toStringAsFixed(2) ?? 'Price not available'}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  widget.cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
