import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:storepro/product_store/model/app_state_model.dart';
import 'package:storepro/product_store/model/icecream.dart';
import 'package:storepro/themes/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.icecream, super.key});


  final Icecreams icecream ;
 // final int quantity ;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: CircleAvatar(
      //   backgroundImage: CachedNetworkImageProvider(icecream.image!),
      // ),
      leading: Container(
        height: 800,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: CachedNetworkImageProvider(icecream.image!),
            fit: BoxFit.cover,
          ),
        )
      ),
      title: Text(
        icecream.flavor!,
        style: Styles.productRowItemName,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '₹ ${icecream.price}',
            style: Styles.productRowItemPrice,
          ),
          Row(
            children: [
              Text(
                      'Quantity ',
                      style: Styles.productRowItemPrice,
                    ),
                    Consumer<AppStateModel>(
                builder: (context, model, child) {
                  int quantity = model.getProductQuantityInCart(icecream.id!) ?? 0;
                  return Text(
                    quantity.toString(),
                    style: Styles.productRowItemPrice,
                  );
                },
              ),
            ],
          ),
      
        ],
      ),
      // trailing: IconButton(
      //   icon: const Icon(Ionicons.add_circle_outline),
      //   onPressed: (){
      //     final model = Provider.of<AppStateModel>(context,listen : false)
      //     .addProductToCart(icecream.id!);
      //     VxToast.show(context, msg: 'Added to Cart',position: VxToastPosition.center);
      //   },
      // ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Ionicons.add_circle_outline),
            onPressed: () {
              final model = Provider.of<AppStateModel>(context, listen: false)
                  .addProductToCart(icecream.id!);
              VxToast.show(context,
                  msg: 'Added to Cart', position: VxToastPosition.center);
            },
          ),
          IconButton(
            icon: const Icon(Ionicons.remove_circle_outline),
            onPressed: () {
               final model = Provider.of<AppStateModel>(context, listen: false)
                   .removeProductToCart(icecream.id!);
                   VxToast.show(context,
                  msg: 'Product removed ', position: VxToastPosition.center);
            },
          ),
        ],
      ),
    
    );
  }
}