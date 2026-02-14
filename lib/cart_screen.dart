import 'package:flutter/material.dart';
import 'product.dart';
import 'summary_page.dart';

class CartScreen extends StatefulWidget {
  final String username;

  CartScreen({required this.username});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotal() {
    double total = 0.0;
    for (var item in Cart.items) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Your Cart', style: TextStyle(color: Colors.blueAccent)),
      ),
      body: Cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 60, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Your cart is empty',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('Add some items from the home screen!',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        'Order for: ${widget.username}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.items.length,
                    itemBuilder: (context, index) {
                      final item = Cart.items[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),

                              // Product Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      item.brand,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Delete Button
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  _removeItemFromCart(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Total Amount
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${calculateTotal().toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Cart.items.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        total: calculateTotal(),
                        username: widget.username,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
    );
  }

  void _removeItemFromCart(int index) {
    setState(() {
      Cart.items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item removed from cart')),
    );
  }
}
