import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:zomato/constant/constant.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          height: .6, color: CupertinoColors.systemGrey),
                      hintText: 'Restaurant name, cuisine, or a dish....',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffDFA2A9),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FilterBar(),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff67D588).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(Icons.restaurant, color: Colors.blue),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cutlery won\'t be added to your order by default',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                'You are free to add it if you need.',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                'Know more',
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        offset: Offset(0, -2),
                                        color: Colors.black),
                                  ],
                                  color: Colors.transparent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                  decorationStyle: TextDecorationStyle.dashed,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: [Color(0xff347ACE), Colors.yellow],
                        begin: Alignment.centerLeft,
                        stops: [0.4, 0.85],
                        end: Alignment.centerRight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '60% OFF',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'inside',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'offers that will leave you stumped',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10,
                                child: Icon(
                                  Icons.navigate_next,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Transform.rotate(
                        angle: 50,
                        child: Image.asset(
                          'assets/images/stump.png',
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        text: "Order again",
                      ),
                      Text(
                        'view history',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.red.withOpacity(.80)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                OrderAgainGridView(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SectionHeading(text: 'Eat what Makes you happy'),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.maxFinite,
                  height: 200,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio:
                              (MediaQuery.of(context).size.width) /
                                  (MediaQuery.of(context).size.height / 2),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          crossAxisCount: 2),
                      itemCount: brandName.length,
                      itemBuilder: (ctx, item) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/images/brand/${brandName[item]}_logo.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: 90,
                                child: Text(
                                  brandName[item],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 5),
                Divider(thickness: 1, indent: 20, endIndent: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('See more'), Icon(Icons.arrow_drop_down)],
                ),
                Divider(thickness: 1, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SectionHeading(text: '910 restaurants around you'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderAgainGridView extends StatelessWidget {
  const OrderAgainGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: double.maxFinite,
      height: 170,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (MediaQuery.of(context).size.width) /
                  (MediaQuery.of(context).size.height / .8),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2),
          itemCount: brandName.length,
          itemBuilder: (ctx, item) {
            return Container(
              child: Row(
                children: [
                  Container(
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/brand/${brandName[item]}_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 90,
                        child: Text(
                          brandName[item],
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Text(
                          '4$item min',
                          style: TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Text(
                          '${item + 1}\0% OFF up to ₹${item + 1}\5',
                          style: TextStyle(
                              color: Colors.blue,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      width: double.maxFinite,
      height: 30,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 10),
              FilterBadge(
                centerText: Text('MAX Saftey'),
                firstIcon: Container(),
                secondIcon: Container(),
              ),
              FilterBadge(
                firstIcon: Icon(Icons.star),
                centerText: Text('PRO'),
                secondIcon: Container(),
              ),
              FilterBadge(
                firstIcon: Container(),
                centerText: Text('Cuisines'),
                secondIcon: Icon(Icons.arrow_drop_down),
              ),
              FilterBadge(
                firstIcon: Container(),
                centerText: Text('Rating 4.0+'),
                secondIcon: Container(),
              ),
              FilterBadge(
                centerText: Text('Fatest Delivery'),
                firstIcon: Container(),
                secondIcon: Container(),
              ),
              FilterBadge(
                centerText: Text('Offers'),
                firstIcon: Container(),
                secondIcon: Container(),
              ),
              FilterBadge(
                centerText: Text('Takeaway'),
                firstIcon: Container(),
                secondIcon: Container(),
              ),
              FilterBadge(
                centerText: Text('more'),
                firstIcon: Container(),
                secondIcon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(width: 100),
            ],
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey)),
              width: 100,
              height: 30,
              child: Row(
                children: [
                  Icon(Icons.sort),
                  Text('Popular'),
                  Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterBadge extends StatelessWidget {
  const FilterBadge({
    Key? key,
    required this.firstIcon,
    required this.centerText,
    required this.secondIcon,
  }) : super(key: key);
  final Widget firstIcon, centerText, secondIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.withOpacity(0.4))),
      child: Row(
        children: [firstIcon, centerText, secondIcon],
      ),
    );
  }
}
