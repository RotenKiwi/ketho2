import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DetailsPage.dart';
import 'CartController.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final shoeName = [
    'Kaptir Super',
    'Ultra Boost',
    'Ultra DNA',
    'Air Force Flyknit',
    'Pegasus Trail',
    'React Infinity'
  ];
  final shoePrice = [
    '\$128.0',
    '\$132.0',
    '\$139.0',
    '\$205.0',
    '\$146.0',
    '\$130.0'
  ];

  final shoeImage = [
    'images/shoe_1.jpg',
    'images/shoe_2.jpg',
    'images/shoe_3.jpg',
    'images/shoe_4.jpg',
    'images/shoe_5.jpg',
    'images/shoe_6.jpg'
  ];

  var cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:
              const Text('Product Page', style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
          itemCount: shoeName.length,
          itemBuilder: (context, index) {
            return ProductListTile(
              shoeName: [shoeName[index]],
              shoePrice: [shoePrice[index]],
              shoeImage: [shoeImage[index]],
            );
          },
        ));
  }
}

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.shoeName,
    required this.shoePrice,
    required this.shoeImage,
  });

  final List<String> shoeName;
  final List<String> shoePrice;
  final List<String> shoeImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Hero(
              tag: shoeImage[0],
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(shoeImage[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shoeName[0],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              Text(shoePrice[0], style: const TextStyle(fontSize: 15)),
            ],
          ),
          const Spacer(
            flex: 10,
          ),
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              Get.to(() => DetailsPage(shoeImage: shoeImage[0],));
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
