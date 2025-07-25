// ignore_for_file: library_private_types_in_public_api, unused_import, library_prefixes

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/favorite/screens/mobile/favoritePage.dart';
import 'package:shella_design/features/cart/screens/mobile/cart_screen.dart';
import 'package:shella_design/features/home/hyper/screens/hyper_screen.dart';
import 'package:shella_design/features/home/shops/screens/shops_screen.dart';
import 'package:shella_design/features/home/super/screens/super_screen.dart';
import 'package:shella_design/features/home/users/screens/user_home_screen.dart';
import 'package:shella_design/features/orders/screens/order_screen/mobile_orders_screen.dart';
import 'package:shella_design/features/settings/screens/settings_screen.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/settings/screens/profile_info.dart';

import '../helper/app_routes.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Super_Screen(),
    // Hyper_Screen(),
    // ShopsScreen(),
    Users_Home_Screen(),
    MobileOrders_Screen(),
    FavoritePage(),
    Cart_Screen(),
    ProfileDetailsPage(),
    ProfileInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  if (index == 4) {
                    nav.push(AppRoutes.accountdetails);
                  } else {
                    _selectedIndex = index;
                  }
                });
              },
              labelType: NavigationRailLabelType.none,
              destinations: List.generate(5, (index) {
                return NavigationRailDestination(
                  icon: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 40,
                        color: _selectedIndex == index ? AppColors.primaryColor : Colors.transparent,
                      ),
                      const SizedBox(height: 5),
                      Image.asset(
                        _getIconPath(index),
                        width: 24,
                        height: 24,
                        color: _selectedIndex == index ? AppColors.primaryColor : AppColors.gryColor,
                      ),
                      const SizedBox(height: 5),
                      if (_selectedIndex == index)
                        Text(
                          _getLabel(index),
                          style: const TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                  label: const Text(''),
                );
              }),
            ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.gryColor,
              items: List.generate(5, (index) {
                return BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 70,
                        color: _selectedIndex == index ? AppColors.primaryColor : Colors.transparent,
                      ),
                      const SizedBox(height: 5),
                      Image.asset(
                        _getIconPath(index),
                        width: 24,
                        height: 24,
                        color: _selectedIndex == index ? AppColors.primaryColor : Colors.grey,
                      ),
                    ],
                  ),
                  label: _selectedIndex == index ? _getLabel(index) : "",
                );
              }),
            ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return AppImages.main_home;
      case 1:
        return AppImages.main_order;
      case 2:
        return AppImages.main_favorites;
      case 3:
        return AppImages.main_cart;
      case 4:
        return AppImages.main_sitings;
      default:
        return AppImages.main_sitings;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "الرئيسية";
      case 1:
        return "الطلبات";
      case 2:
        return "المفضلة";
      case 3:
        return "السلّة";
      case 4:
        return "المزيد";
      default:
        return "";
    }
  }
}
