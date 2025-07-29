import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/features/favorite/widget/mobile/favorite_page_app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: favoritePageAppBar(context, controller: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text(MainAppConstants.favoriteProductsList)),
          Center(child: Text(MainAppConstants.listFavoriteStores)),
        ],
      ),
    );
  }
}
