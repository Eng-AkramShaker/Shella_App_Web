import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/appBar/web/app_bar_web.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/my_points/widgets/my_points_bottom_sheet_widget.dart';
import 'package:shella_design/features/my_points/widgets/my_points_card_widget.dart';
import 'package:shella_design/features/my_points/widgets/my_points_history_widget.dart';
class MyPointsTransactionsScreen extends StatefulWidget {
  final bool fromNotification;
  const MyPointsTransactionsScreen({Key? key, required this.fromNotification}) : super(key: key);

  @override
  _MyPointsTransactionsScreenState createState() => _MyPointsTransactionsScreenState();
}

class _MyPointsTransactionsScreenState extends State<MyPointsTransactionsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoyaltyProvider>().loadProfile();
      context.read<LoyaltyProvider>().getLoyaltyTransactionList('1', false);
      context.read<LoyaltyProvider>().setOffset(1);
    });
  }

  void _onScroll() {
    final prov = context.read<LoyaltyProvider>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !prov.isLoading &&
        prov.offset * 10 < (prov.pageSize ?? 0)) {
      prov.setOffset(prov.offset + 1);
      prov.showBottomLoader();
      prov.getLoyaltyTransactionList(context.read<LoyaltyProvider>().offset.toString(), false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final profile = context.watch<ProfileProvider>();
    final loyalty = context.watch<LoyaltyProvider>();
   // final isLoggedIn = profile.isLoggedIn;

    return Scaffold(
    //  drawer: ResponsiveLayout.isWeb()  ? const MenuDrawer() : null,
      appBar: ResponsiveLayout.isWeb() ? PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: WebHomeApppar(),
        ) : customAppBar(context, title: 'نقاطي', img: 'assets/images/my-points-appbar.png'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  !ResponsiveLayout.isWeb()
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.primaryColor,
              label: const Text('Convert to Wallet',style: TextStyle(color: AppColors.backgroundColor),),
              onPressed: () => _showConvertSheet(context),
            )
          : null,
      body: (loyalty.user == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await loyalty.getLoyaltyTransactionList('1', true);
                      await loyalty.loadProfile();
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                            //  Text( 'Loyalty Points'),
                              SizedBox(
                                  width: 1170,  // fixed
                                  child: ResponsiveLayout.isWeb()
                                      ? Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: LoyaltyCardWidget(),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              flex: 6,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: const LoyaltyHistoryWidget(),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: LoyaltyCardWidget(),
                                            ),
                                            const LoyaltyHistoryWidget(),
                                          ],
                                        ),
                                ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))

    );
  }

  void _showConvertSheet(BuildContext context) {
    final points = context.read<LoyaltyProvider>().user?.loyaltyPoint ?? 0;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ChangeNotifierProvider.value(
        value: context.read<LoyaltyProvider>(),
        child: LoyaltyBottomSheetWidget(amount: points.toString()),
      ),
    );
  }
}