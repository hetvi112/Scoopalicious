import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:storepro/product_store/model/icecream.dart';

class ProductRepo{
  static Future<List<Icecreams>> loadallicecreams() async{
    final res = await rootBundle.loadString('assets/icecream.json');
    final IceCreamData = 
    iceCreamData.fromJson(jsonDecode(res) as Map<String , dynamic>);
    return IceCreamData.icecreams!;
  }
}