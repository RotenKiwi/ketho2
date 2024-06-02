import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;

  void addToCart(List<String> item) {
    cartItems.add(item);
  }

  void removeFromCart(index) {
    cartItems.removeAt(index);
  }
}
