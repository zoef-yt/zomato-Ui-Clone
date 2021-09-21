import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato/appbar/appbar.dart';
import 'package:zomato/bottombar/bottom_bar_widget.dart';
import 'package:zomato/screens/donate_screen.dart';
import 'package:zomato/screens/go_out_screen.dart';
import 'package:zomato/screens/order_screen.dart';
import 'package:zomato/screens/pro_screen.dart';

void main() {
  runApp(MyApp());
}

int selectedItemPosition = 0;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(),
          ),
          body: AnimatedContainer(
            duration: const Duration(seconds: 1),
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedItemPosition = index;
                });
              },
              controller: controller,
              children: <Widget>[
                OrderScreen(),
                GoOutScreen(),
                ProScreen(),
                DonateScreen(),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomBar(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
