// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CartController.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  var cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: cartController.cartItemsName.length,
            itemBuilder: (context, index) {
              return CartListTile(
                quantity: cartController.cartItemsQuantity[index].toString(),
                size: cartController.cartItemsName[index][2],
                shoeImage: cartController.cartItemsName[index][0],
                index: index,
              );
            },
          ),
        ));
  }
}

class CartListTile extends StatelessWidget {
  final String quantity;
  final String size;
  final String shoeImage;
  final int index;

   CartListTile({
    super.key,
    required this.quantity,
    required this.size,
    required this.shoeImage,
    required this.index,
  });

  @override
  var cartController = Get.find<CartController>();
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
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
                  image: AssetImage(shoeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          Column(
            children: [
              Text(
                'Quantity:' + quantity,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Size:' + size,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const Spacer(
            flex: 10,
          ),
          IconButton(
            onPressed: () {
              cartController.removeFromCart(index);
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
