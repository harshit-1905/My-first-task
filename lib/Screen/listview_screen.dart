import 'package:first_task/ApiData/product.dart';
import 'package:first_task/buisnesslogic/fetch_api_products.dart';
import 'package:flutter/material.dart';
class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: 
      Title(color: Colors.black, child: Text('Welcome to the ListView'),),),
      body: FutureBuilder<List<Product>>(
        future: fetchApiProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return ListTile(
                leading: Image.network(p.thumbnail, fit: BoxFit.cover, width: 50),
                title: Text(p.title),
                subtitle: Text('\$${p.price.toStringAsFixed(2)} • ⭐ ${p.rating}\nDescription: ${p.description}'),
                onTap: () {
                  // Navigate to detail view
                },
              );
            },
          );
        },
      ),
    );
  }
}
