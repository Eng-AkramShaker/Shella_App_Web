import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/pickup_and_order_service/widgets/mobile/driver_offer_card.dart';

class DriverOffers extends StatefulWidget {
  const DriverOffers({super.key});

  @override
  State<DriverOffers> createState() => _DriverOffersState();
}

class _DriverOffersState extends State<DriverOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundMap), // Your image path
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 10, right: 12, left: 12.0),
            child: Column(children: [
              DriverOfferCard(),
              SizedBox(
                height: 10,
              ),
              DriverOfferCard(),
              SizedBox(
                height: 10,
              ),
              DriverOfferCard(),
              SizedBox(
                height: 10,
              ),
              DriverOfferCard(),
              SizedBox(
                height: 10,
              ),
              DriverOfferCard(),
              SizedBox(
                height: 10,
              ),
              DriverOfferCard(),
            ]),
          ),
        ),
      ),
    );
  }
}
