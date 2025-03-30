import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storepro/product_store/model/app_state_model.dart';
import 'package:storepro/product_store/widget/product_item.dart';
import 'package:velocity_x/velocity_x.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Icecreams')),
        actions: [
          VxDarkModeButton(showSingleIcon: true,).p12(),
        ],
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          final products = value.getProducts();
          return ListView.builder(
            itemBuilder: (context,index){
              return ProductItem(
                icecream: products[index],
                );
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}