import 'package:flutter/material.dart';
import 'login.dart';
import 'product.dart';
import 'product_info_screen.dart';
import 'cart_screen.dart';
import 'profile.dart';
// import 'summary_page.dart';
// import 'order_confirmation_screen.dart';
import 'about_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(username: '', email: ''), // pass the reg data
    ),
  );
}

class HomeScreen extends StatefulWidget {
  final String username;
  final String email;

  HomeScreen({required this.username, required this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(Icons.location_pin, color: Colors.white),
        title: Text(
          'Cheers - Bedok',
          style: TextStyle(color: Colors.blueAccent),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: _buildCategoryContent(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(username: widget.username),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      username: widget.username,
                      email: widget.email,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => setState(() => _selectedCategory = 'All'),
            icon: _buildCategoryIcon(Icons.apps, 'All'),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            onPressed: () => setState(() => _selectedCategory = 'Drinks'),
            icon: _buildCategoryIcon(Icons.local_drink, 'Drinks'),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            onPressed: () => setState(() => _selectedCategory = 'Food'),
            icon: _buildCategoryIcon(Icons.fastfood, 'Food'),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            onPressed: () => setState(() => _selectedCategory = 'Snacks'),
            icon: _buildCategoryIcon(Icons.cookie, 'Snacks'),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.blueAccent),
        SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCategoryContent() {
    if (_selectedCategory == 'Drinks') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Drinks:'),
          SizedBox(height: 16),
          _buildProductRow(context, ['Sprite', 'Fanta']),
          SizedBox(height: 16),
          _buildProductRow(context, ['Mogu Mogu', 'Pokka Green Tea']),
          SizedBox(height: 16),
          _buildProductRow(context, ['Mocha Coffee']),
        ],
      );
    } else if (_selectedCategory == 'Food') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Food:'),
          SizedBox(height: 16),
          _buildProductRow(
            context,
            ['Nissin Chicken', 'Shin Ramyun'],
          ),
          SizedBox(height: 16),
          _buildProductRow(context, ['Tomyum Wonton']),
        ],
      );
    } else if (_selectedCategory == 'Snacks') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Snacks & Desserts:'),
          SizedBox(height: 16),
          _buildProductRow(context, ['KitKat', 'Ben & Jerrys']),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('You may like these:'),
          SizedBox(height: 16),
          _buildProductRow(context, ['Lay\'s Chips', 'Coke Zero']),
          SizedBox(height: 16),
          _buildProductRow(context, ['Pepsi', 'Cheetos']),
          SizedBox(height: 16),
          _buildSectionTitle('Drinks:'),
          SizedBox(height: 16),
          _buildProductRow(context, ['Sprite', 'Fanta']),
          SizedBox(height: 16),
          _buildProductRow(context, ['Mogu Mogu', 'Pokka Green Tea']),
          SizedBox(height: 16),
          _buildProductRow(context, ['Mocha Coffee']),
          SizedBox(height: 16),
          _buildSectionTitle('Food:'),
          SizedBox(height: 16),
          _buildProductRow(
            context,
            ['Nissin Chicken', 'Shin Ramyun'],
          ),
          SizedBox(height: 16),
          _buildProductRow(context, ['Tomyum Wonton']),
          SizedBox(height: 16),
          _buildSectionTitle('Snacks & Desserts:'),
          SizedBox(height: 16),
          _buildProductRow(context, ['KitKat', 'Ben & Jerrys']),
        ],
      );
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProductRow(BuildContext context, List<String> productNames) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: productNames
          .map((productName) => _buildProductCard(context, productName))
          .toList(),
    );
  }

  Widget _buildProductCard(BuildContext context, String productName) {
    final product = ProductRepository.getProductByName(productName);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductInfoScreen(product: product),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            child: Center(
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
