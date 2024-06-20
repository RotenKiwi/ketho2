import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItemsQuantity = [].obs;
  var cartItemsName = [].obs;

  void addToCart(List<String> namesize, String quantity) {
    if (int.parse(quantity) == 0) {
      cartItemsName.add(namesize);
      cartItemsQuantity.add((int.parse(quantity) + 1));
    } else {
      cartItemsName.removeLast();
      cartItemsName.add(namesize);
      cartItemsQuantity.removeLast();
      cartItemsQuantity.add((int.parse(quantity) + 1));
    }
  }

  void removeFromCart(index) {
    cartItemsQuantity.removeAt(index);
    cartItemsName.removeAt(index);
  }

  void reduceQuantity(int item) {
    cartItemsQuantity.removeLast();
    if(item !=1){
    int newQuantity = item - 1;
    cartItemsQuantity.add(newQuantity);}
  }

  int sumOfQuantity() {
    int sum =0;
    for(int i = 0; i<cartItemsQuantity.length; i++){
      sum += cartItemsQuantity[i] as int;
    }
    return sum;
  }
}
