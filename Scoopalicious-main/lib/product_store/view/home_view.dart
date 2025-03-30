import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:storepro/product_store/model/app_state_model.dart';
import 'package:storepro/product_store/view/cart_view.dart';
import 'package:storepro/product_store/view/icecream_view.dart';
import 'package:storepro/product_store/view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context, listen: true);
    return  Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: model.currentindex,
          children: const [
            IcecreamView(),
            SearchView(), 
            CartView(),
          ],
        )
        
        ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: model.currentindex,
        onDestinationSelected: (value) {  
          model.changeIndex(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Ionicons.ice_cream_outline), 
            label: 'Icecreams',
            ),
            NavigationDestination(
            icon: Icon(Ionicons.search_outline), 
            label: 'Search',
            ),
            NavigationDestination(
            icon: Icon(Ionicons.cart_outline), 
            label: 'Cart',
            ),
        ],),
    );
  }
}