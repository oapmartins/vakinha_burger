import 'package:vakinha_burger/app/models/order.dart';
import 'package:vakinha_burger/app/models/order_pix.dart';

abstract class OrderRepository{
  Future<OrderPix> createOrder(Order order);
}