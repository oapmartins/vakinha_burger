import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VakinhaState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find();
}
