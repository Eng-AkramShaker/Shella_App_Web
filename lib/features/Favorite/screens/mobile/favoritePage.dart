import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Favorite/controllers/discount_controller.dart';
import 'package:shella_design/features/Favorite/screens/mobile/favorite_app_bar.dart';
import 'package:shella_design/features/Favorite/screens/mobile/favorite_tabs_view.dart';
import 'package:shella_design/features/Favorite/screens/mobile/not_loggedIn_view.dart';
import 'package:shella_design/util/auth_helper.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool? _isLoggedIn;
  bool _isLoading = true;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _checkLoginStatusAndLoadData();
  }

  Future<void> _checkLoginStatusAndLoadData() async {
    setState(() {
      _isLoading = true;
    });

    bool loggedIn = await AuthHelper.isLoggedIn();

    if (mounted) {
      setState(() {
        _isLoggedIn = loggedIn;
        _isLoading = false;
      });

      if (loggedIn) {
        _loadFavorites();
      }
    }
  }

  Future<void> _loadFavorites() async {
    if (_isLoggedIn == true) {
      setState(() {
        _isRetrying = true;
      });

      try {
        if (mounted) {
          await Provider.of<FavoriteController>(context, listen: false)
              .getFavoriteList();
        }
      } finally {
        if (mounted) {
          setState(() {
            _isRetrying = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FavoriteAppBar(
        tabController: _tabController,
        onRefresh: _isRetrying ? null : _loadFavorites,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.green))
          : !_isLoggedIn!
              ? NotLoggedInView(onLoginComplete: _checkLoginStatusAndLoadData)
              : FavoriteTabsView(
                  tabController: _tabController,
                  isRetrying: _isRetrying,
                  onRefresh: _loadFavorites,
                  onRelogin: _checkLoginStatusAndLoadData,
                ),
    );
  }
}
