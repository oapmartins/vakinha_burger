
import 'package:vakinha_burger/app/models/shopping_car_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCarModel> items;
  
  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
