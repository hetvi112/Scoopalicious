import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storepro/product_store/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: 100).animate(_controller)
    ..addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Stack(
        children: [
          Image.asset(
            'assets/icecreambg.png',
             fit: BoxFit.cover,
             height: double.infinity,
             color: Colors.black.withOpacity(0.7),
             colorBlendMode: BlendMode.darken,
             ),
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    child : Image.asset('assets/icecremlogo.png', fit: BoxFit.contain,),
                  ),
              
                  SizedBox(height: 16,),
                  Text('Discover the Delights of Scoopalicious',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: () {
                    Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                      ),
                      (route) => false,
                      );
                  }, 
                  child: Text('Login'),
                  )
                ],
              ),
             )
          
        ],
      ),
    );
  }
} 