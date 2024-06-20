import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItemsQuantity = [].obs;
  var cartItemsName = [].obs;

  void addToCart(List<String> namesize, String quantity) {
    if (double.parse(quantity) == 0) {
      cartItemsName.add(namesize);
      cartItemsQuantity.add((double.parse(quantity)+1).toString());
    } else {
      cartItemsName.removeLast();
      cartItemsName.add(namesize);
      cartItemsQuantity.removeLast();
      cartItemsQuantity.add((int.parse(quantity)+1).toString());
    }
  }

  void removeFromCart(index) {
    cartItemsQuantity.removeAt(index);
    cartItemsName.removeAt(index);
  }

  void reduceQuantity(int item) {
    cartItemsQuantity.removeLast();
    int newQuantity = item - 1;
    cartItemsQuantity.add(newQuantity.toString());
  }
}
