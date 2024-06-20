// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab4_getx_revision/CartController.dart';
import 'package:lab4_getx_revision/Cartpage.dart';

class DetailsPage extends StatefulWidget {
  final String shoeImage;
  final String showName;

  DetailsPage({super.key, required this.shoeImage, required this.showName});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<String> shoeSizes = ['36', '37', '38', '39', '40', '41', '42'];
  String? value; //Shoe size
  int quantity = 0; //Qty

  @override
  Widget build(BuildContext context) {
    var cartController =
        Get.find<CartController>(); //find controller injected in first page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Details', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Obx(() => cartController.cartItemsName.length > 0
                ? Badge(
                    label: Text(
                      cartController.cartItemsName.length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(Icons.shopping_cart),
                  )
                : Icon(Icons.shopping_cart)),
            onPressed: () {
              if (cartController.cartItemsName.length > 0)
              Get.to(() => Cartpage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Hero(
              tag: widget.shoeImage,
              child: Container(
                width: 300.0,
                height: 280.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.shoeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.showName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Shoe Size:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  hint: Text('Choose a size'),
                  value: value,
                  onChanged: (String? newSize) {
                    setState(() {
                      value = newSize!;
                      quantity = 0;
                    });
                  },
                  items:
                      shoeSizes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (value != null)
                      setState(() {
                        cartController.addToCart([widget.shoeImage, widget.showName, value!], quantity.toString());
                        quantity++;
                        print(cartController.cartItemsName);
                      });
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        cartController.reduceQuantity(quantity);
                        quantity--;

                      }
                    });
                  },
                ),
              ],
            ),
            Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
