import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/appBar/web/widgets/nav_item_web.dart';
import 'package:shella_design/common/widgets/appBar/web/widgets/search_app_bar_web.dart';
import 'package:shella_design/common/widgets/appBar/web/widgets/video_logo_web.dart';
import '../../../helper/app_routes.dart';
import '../../../util/app_colors.dart';
import '../../gap/width/width.dart';
import 'navBarState/nav_bar_state_web.dart';

class WebHomeApppar extends StatelessWidget {
  WebHomeApppar({super.key, this.isSearchScreen});

  final bool? isSearchScreen;

  final List<NavItem> _navItems = [
    NavItem(title: 'السوق', icon: Icons.home_outlined),
    NavItem(title: 'طلباتي', icon: Icons.list_alt),
    NavItem(title: 'السلة', icon: Icons.shopping_cart),
    NavItem(title: 'تسجيل الدخول', icon: Icons.account_circle),
    NavItem(title: 'اتصل بنا', icon: Icons.mail),
    NavItem(title: 'اللغة', icon: Icons.language),
  ];

  void _handleTap(BuildContext context, int index) {
    NavBarState.setIndex(index);

    switch (index) {
      case 0:
        nav.push(AppRoutes.webHome);

        break;
      case 1:
        nav.push(AppRoutes.webHome);

        break;
      // case 2:
      //   showDialog(
      //     context: context,
      //     builder: (_) => Dialog(child: CartSideMenu()),
      //   );
      //   break;
      case 3:
        nav.push(AppRoutes.accountdetails);

        break;
      case 4:
        nav.push(AppRoutes.contactUs);

        break;
      case 5:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: NavBarState.currentIndex,
      builder: (context, currentIndex, _) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Card(
            color: AppColors.backgroundColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(context, 0.2),
                    height: 50,
                    child: const VideoLogoWidget(),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SearchAppBar(
                      isSearchScreen: isSearchScreen,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: List.generate(
                      _navItems.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          height: 50,
                          child: NavItemWidget(
                            item: _navItems[index],
                            isSelected: index == currentIndex,
                            onTap: () => _handleTap(context, index),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
