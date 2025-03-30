import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:storepro/product_store/model/app_state_model.dart';
import 'package:storepro/product_store/widget/cart_item.dart';
import 'package:storepro/themes/styles.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  String? name;
  String? email;
  String? mobile;
  String? address;
  String? pin;
  DateTime? dateTime = DateTime.now();
  final formkey = GlobalKey<FormState> ();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.person_outline),
        labelText: 'Name'),
      keyboardType: TextInputType.name,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String? value){
        name = value;
      },
      onChanged: (value) => setState(() {
        name = value;
      }),
    );
  }


  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.mail_outline),
        labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Email is required';
        }
        if (!RegExp(r'\S+@\S.\S+').hasMatch(value)){
            return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (String? value){
        email = value;
      },
      onChanged: (value) => setState(() {
        email = value;
      }),
    );
  }

  Widget _buildMobile(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.call_outline),
        labelText: 'Mobile'),
      keyboardType: TextInputType.number,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Mobile is required';
        }
        return null;
  },
  onSaved: (value) {
    mobile = value;
  },
  onChanged: (value) => setState(() {
    mobile = value;
  }),
  );
  }

  Widget _buildAddress(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.locate_outline),
        labelText: 'Address'),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value){
        if(value!.isEmpty){
          return 'Address is required';
        }
        return null;
      },
      onSaved: (String? value){
        address = value;
      },
      onChanged: (value) => setState(() {
        address = value;
      }),
    );
  }

  Widget _buildTimepicker(){
    return InkWell(
      onTap: ()async{
        final newtime = await showDatePicker(
          context: context, 
          initialDate: dateTime!, 
          firstDate: DateTime(2000), 
          lastDate: DateTime(2027,),
          );
          if (newtime != null) {
            setState(() {
              dateTime = newtime;
            });
            
          }
      },

      child: Column(
        children:<Widget> [
          Row(
            children: <Widget>[
              Icon(
                Ionicons.time_outline,
                size : 28,            
              ),
      
              SizedBox(width: 6,),
              Text('Delivery Time',
              style: Styles.deliveryTimeLabel,
              ),
              SizedBox(width: 70,),
              Text(
               DateFormat.yMMMd().add_jm().format(dateTime!),
              style: Styles.deliveryTimeLabel,
              ),
            ],
          ),
          
          
        ],
        
      ),
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            
            children: [
              ExpansionTile(title: Text('Address Details'),
              children: [
              Form (
                key: formkey,
                child: Column(
                  children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildName(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildEmail(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildMobile(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildAddress(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildTimepicker(),
              ),
            ],
                ),
              ),
              ],
              ),
              const Divider(),
              if(value.productInCart.isNotEmpty) ...[
                ListView.builder(
                  itemBuilder: (context,index){
                    return CartItem(product: value.getproductById(
                      value.productInCart.keys.toList()[index],
                    ),
                    quantity: value.productInCart.values.toList()[index],
                    );
                },
                itemCount: value.productInCart.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shipping + Tax',
                        style: Styles.productRowItemPrice,
                      ),
                      Text(
                        '₹ ${(value.shippingCost).toStringAsFixed(2)} + ${(value.tax).toStringAsFixed(2)}',
                        style: Styles.productRowItemPrice,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: Styles.productRowItemName,
                      ),
                      Text(
                        '₹ ${value.totalCost}',
                        style: Styles.productRowItemName,
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed:(){
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        value.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Order Placed Successfully'),
                          ),
                        );
                      }
                    }, 
                    child: Text('Placed Order'),
                    ),
                )
              ],
            ],
          );
        },
      ),
    );
  }
}