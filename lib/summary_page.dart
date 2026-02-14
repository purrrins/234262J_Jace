import 'package:flutter/material.dart';
import 'product.dart';
import 'order_confirmation_screen.dart';
import 'regUsers.dart';

class SummaryPage extends StatelessWidget {
  final double total;
  final String username;

  SummaryPage({required this.total, required this.username});

  @override
  Widget build(BuildContext context) {
    // get user data
    String userAddress = 'Not set';
    String userPhone = 'Not set';

    for (var user in registeredUsers) {
      if (user['username'] == username) {
        userAddress = user['address'] ?? 'Not set';
        userPhone = user['phone'] ?? 'Not set';
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Order Summary',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Info
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Username: $username',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Phone: $userPhone',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userAddress,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Order Items
            Text(
              'Order Items:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Cart.items.isEmpty
                  ? Center(
                      child: Text(
                        'No items in cart',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: Cart.items.length,
                      itemBuilder: (context, index) {
                        var item = Cart.items[index];

                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Total
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Generate unique order number
                  String orderNo =
                      'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationScreen(
                        orderNo: orderNo,
                        address: userAddress,
                        totalAmount: total,
                        username: username,
                        phoneNumber: userPhone,
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
                  'Confirm Order',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
