import 'package:flutter/material.dart';
import 'package:storepro/product_store/view/login_view.dart';
import 'package:storepro/product_store/view/splashscreen.dart';
import 'package:storepro/themes/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return VxApp(
      store: MyStore(),
      builder: (context, vxData) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: vxData.isDarkMode ? Brightness.dark : Brightness.light,
          colorScheme: vxData.isDarkMode
              ? Styles.darkColorScheme
              : Styles.lightColorScheme,
        ),
        // darkTheme: ThemeData(
        //   useMaterial3: true,
        //   colorScheme: Styles.darkColorScheme,
        // ),
        home: const SplashScreen(),
      ),
    );
  }
}

class MyStore extends VxStore {}
