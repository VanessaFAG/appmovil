import 'package:flutter/material.dart';
import 'package:movil2025/tarea3/details_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = [
      //lista de productos fijos, ni se agregan ni se quitan jsjs
      {
        "title": "Fried Chicken",
        "subtitle": "Golden brown fried chicken",
        "price": "\$20.00",
        "image": "assets/tarea3/chicken.png",
        "rating": 4.5,
        "quantity": 2, //la cantidad de lo que pidio de comida, fijo tambien
      },
      {
        "title": "Cheese Sandwich",
        "subtitle": "Grilled Cheese Sandwich",
        "price": "\$18.00",
        "image": "assets/tarea3/chanwis.png",
        "rating": 4.0,
        "quantity": 3,
      },
      {
        "title": "Egg Pasta",
        "subtitle": "Spicy Chicken Pasta",
        "price": "\$15.00",
        "image": "assets/tarea3/egg.png",
        "rating": 5.0,
        "quantity": 1,
      },
    ];

    return Column(
      children: [//los productos
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(
                        title: item["title"] as String,
                        price: item["price"] as String,
                        image: item["image"] as String,
                        rating: item["rating"] as double,
                      ),
                    ),
                  );
                },
                
                child: Card(//cartitas de los productos
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.white,//color del fonde del deste de la desta 
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item["image"] as String,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item["title"] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["subtitle"] as String,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              item["price"] as String,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                              size: 18,
                            ),
                            Text(
                              (item["rating"] as double).toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(
                      "${item["quantity"]}x",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Footer con Delivery Time y Total
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Delivery Time",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.timer, color: Colors.red),
                  SizedBox(width: 4),
                  Text("25 mins"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text(
                    "Total Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "\$109.00",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
