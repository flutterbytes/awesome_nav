import 'package:amazing_navigation/pages/coffee_page.dart';
import 'package:amazing_navigation/pages/fast_food_page.dart';
import 'package:amazing_navigation/pages/ice_cream_page.dart';
import 'package:amazing_navigation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  var coffeePage, fastFoodPage, iceCreamPage;
  AnimationController animationController;
  List pagesList = List();

  @override
  void initState() {
    coffeePage = CoffeePage(
      onToggle: toggleNavigation,
    );
    fastFoodPage = FastFoodPage(
      onToggle: toggleNavigation,
    );
    iceCreamPage = IceCreamPage(
      onToggle: toggleNavigation,
    );
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    pagesList.addAll([coffeePage, fastFoodPage, iceCreamPage]);
    super.initState();
  }

  void toggleNavigation() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.grey[900],
      child: Container(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 64,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-512.png",
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Nicole",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 28,
                            ),
                            onPressed: () {
                              toggleNavigation();
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.06,
                      horizontal: size.width * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              pagesList.remove(coffeePage);
                              pagesList.insert(0, coffeePage);
                            });
                            toggleNavigation();
                          },
                          child: MenuItems(
                            icon: Icons.emoji_food_beverage,
                            category: "Coffee and drinks",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              pagesList.remove(fastFoodPage);
                              pagesList.insert(0, fastFoodPage);
                            });
                            toggleNavigation();
                          },
                          child: MenuItems(
                            icon: Icons.fastfood,
                            category: "Fast Food",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              pagesList.remove(iceCreamPage);
                              pagesList.insert(0, iceCreamPage);
                            });
                            toggleNavigation();
                          },
                          child: MenuItems(
                            icon: Icons.icecream,
                            category: "Ice Cream",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Transform(
              alignment: AlignmentDirectional.bottomCenter,
              transform: Matrix4.identity()
                ..scale(0.65)
                ..translate(0.0, size.height * 0.46),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 16,
                          spreadRadius: 4),
                    ]),
                child: pagesList[2],
              ),
            ),
            Transform(
              alignment: AlignmentDirectional.bottomCenter,
              transform: Matrix4.identity()
                ..scale(0.75)
                ..translate(0.0, size.height * 0.55),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 16,
                          spreadRadius: 4),
                    ]),
                child: pagesList[1],
              ),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (ctx, _) {
                double scale = 1 - (animationController.value * 0.15);
                double slide = size.height * 0.64 * animationController.value;
                double radius = animationController.value * 16;
                return Transform(
                  alignment: AlignmentDirectional.bottomCenter,
                  transform: Matrix4.identity()
                    ..scale(scale)
                    ..translate(0.0, slide),
                  child: InkWell(
                    onTap: () {
                      animationController.isCompleted
                          ? toggleNavigation()
                          : null;
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 16,
                                spreadRadius: 4),
                          ]),
                      child: pagesList[0],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
