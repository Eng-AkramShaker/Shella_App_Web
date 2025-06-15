import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/product/controllers/store_details_provider.dart';
import 'package:shella_design/features/product/widgets/loader_screen/custom_loader.dart';
import 'package:shella_design/features/product/widgets/store_details_appbar/product_app_bar.dart';
import 'package:shella_design/features/product/widgets/store_details_category_chips/product_category_chips.dart';
import 'package:shella_design/features/product/widgets/store_details_list_view/product_list_view.dart';

class ProductView extends StatefulWidget {
  final StoreModel store;

  const ProductView({Key? key, required this.store}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late final StoreDetailsProvider _provider;
  late final ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _provider = StoreDetailsProvider(storeId: widget.store.id);
    _scrollCtrl = ScrollController()..addListener(_onScroll);

    _provider.loadStoreDetails().then((_) {
      _provider.loadProducts(refresh: true);
    });
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
        _scrollCtrl.position.maxScrollExtent - 200) {
      _provider.loadProducts();
    }
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<StoreDetailsProvider>(
        builder: (context, prov, _) {
          final store = prov.storeDetails;
          if (store == null && prov.isLoadingStoreDetails) {
            return Center(
              child: const CustomLoader(), 
            );
          }

          if (store == null) {
            return const Scaffold(
                body: Center(child: Text('Failed to load store data.')));
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              controller: _scrollCtrl,
              headerSliverBuilder: (_, __) => [
                ProductAppBar(store: widget.store),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProductCategoryChips(
                    categories: store.categories,
                    selectedId: prov.selectedCategoryId,
                    onSelect: prov.setCategory,
                  ),
                ),
              ],
              body: ProductListView(provider: prov),
            ),
          );
        },
      ),
    );
  }
}
