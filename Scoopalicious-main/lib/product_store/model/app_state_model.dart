import 'package:flutter/material.dart';
import 'package:storepro/product_store/data/product_repo.dart';
import 'package:storepro/product_store/model/icecream.dart';


double _salestaxRate = 0.18;
double _shippingCostPerItem = 10;
class AppStateModel extends ChangeNotifier {
  int currentindex =0;

  void changeIndex(int index){
    currentindex = index;
    notifyListeners();
  }

  List<Icecreams> _availableProducts = [];
  
  final _productInCart = <int,int> {};
  
  
  Map <int,int> get productInCart{
  return Map.from(_productInCart);
 }

  Icecreams getproductById(int id){
    return _availableProducts.firstWhere((element) => element.id == id);
  }

  List<Icecreams> getProducts(){
    return _availableProducts;
  }

  int get totalCartQuantity{
    return _productInCart.values.fold(0, (sum, val) => sum+val);
  }

  int? getProductQuantityInCart(int productId) {
    return _productInCart[productId];
  }

  double get subtotalCost {
    return _productInCart.keys
    .map((id) => _availableProducts[id].price! * _productInCart[id]!)
    .fold(0, (sum, val) => sum + val );
  }

double get shippingCost {
  return _shippingCostPerItem * _productInCart.values.fold(0, (sum, val) => sum + val );
}
double get tax {
  return subtotalCost* _salestaxRate;
}
double get totalCost {
  return subtotalCost + shippingCost + tax ;
}

void addProductToCart(int productid){
  if(!_productInCart.containsKey(productid)){
    _productInCart[productid] = 1;
  }
  else{
    _productInCart[productid] = _productInCart[productid]! + 1 ;
  }
  notifyListeners();
}

void removeProductToCart(int productid){
  if(_productInCart[productid] == 1){
    _productInCart.remove(productid) ;
  }
  else{
    _productInCart[productid] = _productInCart[productid]! - 1 ;
  }
  notifyListeners();
}

void clearCart() {
  _productInCart.clear();
  notifyListeners();
}

List<Icecreams> search(String query)
{
  return _availableProducts
  .where(
    (product) => product.flavor!.toLowerCase().contains(query.toLowerCase()),
    ).toList();
}

Future<void> loadproduct() async{
  _availableProducts = await ProductRepo.loadallicecreams();
  notifyListeners();
}


  
}
