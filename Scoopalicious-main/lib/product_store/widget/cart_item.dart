import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
import 'package:storepro/product_store/model/icecream.dart';
import 'package:storepro/themes/styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product, required this.quantity});

  final Icecreams product;
  
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(product.image!),
      ),
      title: Text(
        product.flavor!,
        style: Styles.productRowItemName,
      ),
      subtitle: Text(
        '${quantity > 1 ? '$quantity x' : ''}₹ ${product.price}',
        style: Styles.productRowItemPrice,
      ),
      trailing: Text(
        '₹ ${(product.price! * quantity).toStringAsFixed(2)}',
        style: Styles.productRowItemName,
      )
      ),
      );
  }
}