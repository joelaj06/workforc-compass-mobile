import 'package:flutter/material.dart';
import 'package:work_compass/core/presentation/theme/app_theme.dart';

import '../../../../../core/presentation/nav/bottom_nav_icons.dart';
import '../../../../../core/presentation/nav/bottom_nav_tabs.dart';
import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/theme/secondary_color.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

int _selectedIndexItem = 0;

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> navBarItemList = <Widget>[];

    for (int i = 0; i < navIconList.length; i++) {
      navBarItemList.add(
        _buildNavIconContainer(context,
            i == _selectedIndexItem ? navIconSolidList[i] : navIconList[i], i),
      );
    }

    return Scaffold(
      body: SafeArea(child: navPages[_selectedIndexItem]),
      bottomNavigationBar: _buildNavContainer(navBarItemList),
    );
  }

  Widget _buildNavContainer(List<Widget> navBarItemList) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Set the color of the shadow
            spreadRadius: 5, // Set the spread radius of the shadow
            blurRadius: 7, // Set the blur radius of the shadow
            offset: const Offset(0, 3), // Set the offset of the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(children: navBarItemList),
    );
  }

  Widget _buildNavIconContainer(
      BuildContext context, IconData icon, int index) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndexItem = index;
        });
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        width: width / navIconList.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnimatedContainer(decoration: BoxDecoration(
              color: index == _selectedIndexItem
                  ? context.colors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50)
            ),
              duration: const Duration(milliseconds: 300),
              alignment: index == _selectedIndexItem
                  ? Alignment.center
                  : Alignment.bottomCenter,
              height: 5,
              width: 5,// (width / navIconList.length) * 0.3,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: index == 2
                  ? Badge(
                      backgroundColor: SecondaryColor.color.shade900,
                      label: const Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(
                        icon,
                        color: index == _selectedIndexItem
                            ? context.colors.primary
                            : Colors.grey,
                      ),
                    )
                  : Icon(
                      icon,
                      color: index == _selectedIndexItem
                          ? context.colors.primary
                          : Colors.grey,
                    ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Text(
                navIconTexts[index],
                style: TextStyle(
                  color: index == _selectedIndexItem
                      ? PrimaryColor.color
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
