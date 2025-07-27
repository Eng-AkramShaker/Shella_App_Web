import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:shella_design/common/hover/text_hover.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/custom_image.dart';
import 'package:shella_design/common/util/dimensions.dart';
import 'package:shella_design/common/util/navigation/custom_image_widget.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/green_loading_circle.dart';
import 'package:shella_design/features/advertisment/controller/advertisment_controller.dart';
import 'package:shella_design/features/advertisment/model/advertisment_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:sixam_mart/features/language/controllers/language_controller.dart'; // إذا كنت ستزيل GetX بالكامل، لن تحتاج لهذا
// import 'package:sixam_mart/features/favourite/controllers/favourite_controller.dart'; // ستكون Provider الآن
// import 'package:sixam_mart/features/home/controllers/advertisement_controller.dart'; // ستكون AdvertisementProvider الآن

import 'package:video_player/video_player.dart';

// تعريف بسيط لـ ResponsiveHelper (إذا لم يكن هناك بديل آخر)
class ResponsiveHelper {
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000;
  }

  // static bool isWeb() {}
}

// ===========================================================================
// HighlightWidget
// ===========================================================================

class HighlightWidget extends StatefulWidget {
  const HighlightWidget({super.key});

  @override
  State<HighlightWidget> createState() => _HighlightWidgetState();
}

class _HighlightWidgetState extends State<HighlightWidget> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    // استخدام Consumer للاستماع إلى التغييرات في AdvertisementProvider
    return Consumer<AdvertisementProvider>(
        builder: (context, advertisementProvider, child) {
      return advertisementProvider.advertisementList != null &&
              advertisementProvider.advertisementList!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Stack(
                children: [
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.paddingSizeDefault,
                        right: Dimensions.paddingSizeDefault,
                        top: Dimensions.paddingSizeDefault,
                        bottom: Dimensions.paddingSizeExtraSmall,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // استبدال .tr بترجمة نصية مباشرة أو بديل ترجمة
                                Text('Highlights for You',
                                    style: robotoBold.copyWith(
                                        fontSize: 30, color: Colors.black)),
                                const SizedBox(width: 5),
                                // استبدال .tr بترجمة نصية مباشرة أو بديل ترجمة
                                Text('See our most popular store and item',
                                    style: robotoRegular.copyWith(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 20)),
                              ],
                            ),
                            const CustomAssetImageWidget(
                              MainAppConstants.highlightIcon,
                              height: 50,
                              width: 50,
                            ),
                          ]),
                    ),
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount:
                          advertisementProvider.advertisementList!.length,
                      options: CarouselOptions(
                        enableInfiniteScroll:
                            advertisementProvider.advertisementList!.length > 1,
                        autoPlay: advertisementProvider.autoPlay,
                        height: 280,
                        viewportFraction: 1,
                        disableCenter: true,
                        onPageChanged: (index, reason) {
                          advertisementProvider.setCurrentIndex(index, true);

                          if (advertisementProvider
                                  .advertisementList?[index].addType ==
                              "video_promotion") {
                            advertisementProvider.updateAutoPlayStatus(
                                status: false);
                          } else {
                            advertisementProvider.updateAutoPlayStatus(
                                status: true);
                          }
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return advertisementProvider
                                    .advertisementList?[index].addType ==
                                'video_promotion'
                            ? HighlightVideoWidget(
                                advertisement: advertisementProvider
                                    .advertisementList![index],
                              )
                            : HighlightStoreWidget(
                                advertisement: advertisementProvider
                                    .advertisementList![index]);
                      },
                    ),
                    const AdvertisementIndicator(),
                    const SizedBox(
                      height: Dimensions.paddingSizeExtraSmall,
                    ),
                  ]),
                ],
              ),
            )
          : advertisementProvider.advertisementList == null
              ? const SizedBox()
              : const SizedBox();
    });
  }
}

// ===========================================================================
// HighlightStoreWidget
// ===========================================================================

class HighlightStoreWidget extends StatelessWidget {
  final AdvertisementModel advertisement;
  const HighlightStoreWidget({super.key, required this.advertisement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        color: Theme.of(context).cardColor,
        border: Border.all(
            color: Theme.of(context).disabledColor.withOpacity(0.07),
            width: 2), // Changed .withValues to .withOpacity
      ),
      child: TextHover(builder: (hovered) {
        return InkWell(
          onTap: () {
            // استبدال Get.toNamed بـ Navigator.push
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => StoreScreen(
            //         store: Store(id: advertisement.storeId),
            //         fromModule: false),
            //     settings: RouteSettings(
            //         name: RouteHelper.getStoreRoute(
            //             id: advertisement.storeId, page: 'store')),
            //   ),
            // );
          },
          child: Column(children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radiusDefault)),
                child: Stack(
                  children: [
                    CustomImage(
                      isHovered: hovered,
                      image: advertisement.coverImageFullUrl ?? '',
                      fit: BoxFit.cover,
                      height: 160,
                      width: double.infinity,
                    ),
                    (advertisement.isRatingActive == 1 ||
                            advertisement.isReviewActive == 1)
                        ? Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Theme.of(context).cardColor,
                                    width: 2),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 0)
                                ],
                              ),
                              child: Row(
                                children: [
                                  advertisement.isRatingActive == 1
                                      ? Icon(Icons.star,
                                          color: Theme.of(context).cardColor,
                                          size: 15)
                                      : const SizedBox(),
                                  SizedBox(
                                      width: advertisement.isRatingActive == 1
                                          ? 5
                                          : 0),
                                  advertisement.isRatingActive == 1
                                      ? Text(
                                          '${advertisement.averageRating?.toStringAsFixed(1)}',
                                          style: robotoBold.copyWith(
                                              color:
                                                  Theme.of(context).cardColor))
                                      : const SizedBox(),
                                  SizedBox(
                                      width: advertisement.isRatingActive == 1
                                          ? 5
                                          : 0),
                                  advertisement.isReviewActive == 1
                                      ? Text(
                                          '(${advertisement.reviewsCommentsCount})',
                                          style: robotoRegular.copyWith(
                                              color:
                                                  Theme.of(context).cardColor))
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          width: 2), // Changed .withValues to .withOpacity
                    ),
                    child: ClipOval(
                      child: CustomImage(
                        image: advertisement.profileImageFullUrl ?? '',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(advertisement.title ?? '',
                                      style: robotoMedium.copyWith(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                // استخدام Consumer لـ FavouriteProvider
                                // Consumer<FavouriteProvider>(
                                //     builder: (context, favouriteProvider, child) {
                                //   bool isWished = favouriteProvider.wishStoreIdList
                                //       .contains(advertisement.storeId);
                                //   return CustomFavouriteWidget(
                                //     isWished: isWished,
                                //     isStore: true,
                                //     storeId: advertisement.storeId,
                                //   );
                                // }),
                              ]),
                          const SizedBox(height: 3),
                          Text(
                            advertisement.description ?? '',
                            style: robotoRegular.copyWith(
                                fontSize: 20,
                                color: Theme.of(context).hintColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                ]),
              ),
            ),
          ]),
        );
      }),
    );
  }
}

// ===========================================================================
// HighlightVideoWidget
// ===========================================================================

class HighlightVideoWidget extends StatefulWidget {
  final AdvertisementModel advertisement;
  const HighlightVideoWidget({super.key, required this.advertisement});

  @override
  State<HighlightVideoWidget> createState() => _HighlightVideoWidgetState();
}

class _HighlightVideoWidgetState extends State<HighlightVideoWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.duration ==
          videoPlayerController.value.position) {
        // الوصول إلى AdvertisementProvider باستخدام Provider.of
        // مع listen: false لتجنب إعادة بناء الـ Widget بشكل غير ضروري
        if (kIsWeb) {
          // استبدال GetPlatform.isWeb بـ kIsWeb
          Future.delayed(const Duration(seconds: 4), () {
            Provider.of<AdvertisementProvider>(context, listen: false)
                .updateAutoPlayStatus(status: true, shouldUpdate: true);
          });
        } else {
          Provider.of<AdvertisementProvider>(context, listen: false)
              .updateAutoPlayStatus(status: true, shouldUpdate: true);
        }
      }
    });
  }

  Future<void> initializePlayer() async {
    final videoUrl = widget.advertisement.videoAttachmentFullUrl;

    if (videoUrl == null || videoUrl.isEmpty) {
      debugPrint('❌ initializePlayer   URL is null or empty');
      return;
    }

    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    try {
      await videoPlayerController.initialize();
      _createChewieController();
      setState(() {});
    } catch (e) {
      debugPrint('❌  initializePlayer Failed to initialize video player: $e');
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      // استخدام ResponsiveHelper المحلية بدلاً من GetX
      aspectRatio: videoPlayerController.value.aspectRatio *
          (ResponsiveHelper.isDesktop(context) ? 1 : 1.3),
    );
    _chewieController?.setVolume(0);
  }

  @override
  void dispose() {
    videoPlayerController.dispose(); // تأكد من التخلص من controller
    _chewieController?.dispose(); // تأكد من التخلص من controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // استخدام Consumer للاستماع إلى التغييرات في AdvertisementProvider
    return Consumer<AdvertisementProvider>(
        builder: (context, advertisementProvider, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: Theme.of(context).cardColor,
          border: Border.all(
              color: Theme.of(context).disabledColor.withOpacity(0.07),
              width: 2), // Changed .withValues to .withOpacity
        ),
        child: Column(children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Dimensions.radiusDefault)),
              child: Stack(
                children: [
                  _chewieController != null &&
                          _chewieController!
                              .videoPlayerController.value.isInitialized
                      ? Stack(
                          children: [
                            Container(
                                color: Colors.black,
                                child: Chewie(controller: _chewieController!)),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.advertisement.title ?? '',
                      style: robotoMedium.copyWith(
                          fontSize: 30, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.advertisement.description ?? '',
                              style: robotoRegular.copyWith(
                                  fontSize: 20,
                                  color: Theme.of(context).hintColor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: Dimensions.paddingSizeDefault),
                          InkWell(
                            onTap: () {
                              // استبدال Get.toNamed بـ Navigator.push
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => StoreScreen(
                              //         store: Store(id: widget.advertisement.storeId),
                              //         fromModule: false),
                              //     settings: RouteSettings(
                              //         name: RouteHelper.getStoreRoute(
                              //             id: widget.advertisement.storeId, page: 'store')),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                              ),
                              child: Icon(Icons.arrow_forward,
                                  color: Theme.of(context).cardColor, size: 20),
                            ),
                          ),
                        ]),
                  ]),
            ),
          ),
        ]),
      );
    });
  }
}

// ===========================================================================
// AdvertisementIndicator
// ===========================================================================

class AdvertisementIndicator extends StatelessWidget {
  const AdvertisementIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام Consumer للاستماع إلى التغييرات في AdvertisementProvider
    return Consumer<AdvertisementProvider>(
        builder: (context, advertisementProvider, child) {
      return advertisementProvider.advertisementList != null &&
              advertisementProvider.advertisementList!.length > 2
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: advertisementProvider.advertisementList!
                    .map((advertisement) {
                  int index = advertisementProvider.advertisementList!
                      .indexOf(advertisement);
                  return index == advertisementProvider.currentIndex
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "${index + 1}/ ${advertisementProvider.advertisementList!.length}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        )
                      : const SizedBox();
                }).toList(),
              ),
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ])
          : advertisementProvider.advertisementList != null &&
                  advertisementProvider.advertisementList!.length == 2
              ? Align(
                  alignment: Alignment.center,
                  child: AnimatedSmoothIndicator(
                    activeIndex: advertisementProvider.currentIndex,
                    count: advertisementProvider.advertisementList!.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      spacing: 5,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: Theme.of(context).hintColor.withOpacity(
                          0.6), // Changed .withValues to .withOpacity
                    ),
                  ),
                )
              : const SizedBox();
    });
  }
}

// ===========================================================================
// AdvertisementShimmer
// ===========================================================================

// class AdvertisementShimmer extends StatelessWidget {
  // const AdvertisementShimmer({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   // هذه الشاشة لا تتفاعل مباشرة مع AdvertisementProvider،
  //   // لذا لا حاجة لـ Consumer هنا
  //   return Shimmer(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.blue.withOpacity(0.05), // Changed .withValues to .withOpacity
  //       ),
  //       margin: EdgeInsets.only(
  //         top: ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeLarge * 3.5 : 0,
  //         right: !ResponsiveHelper.isDesktop(context) || // استخدم منطق معكوس للـ RTL إذا لم يكن لديك LocalizationProvider
  //             (Theme.of(context).brightness == Brightness.light) // مثال على كيفية التحقق من RTL إذا لم يكن لديك LocalizationController
  //               ? 0 : Dimensions.paddingSizeLarge, // إذا كان LTR (light theme assumed), فالـ margin على اليمين
  //         left: ResponsiveHelper.isDesktop(context) &&
  //             (Theme.of(context).brightness == Brightness.dark) // مثال على كيفية التحقق من RTL إذا لم يكن لديك LocalizationController
  //             ? Dimensions.paddingSizeLarge : 0, // إذا كان RTL (dark theme assumed), فالـ margin على اليسار
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const SizedBox(
  //               height: Dimensions.paddingSizeLarge,
  //             ),
  //             Container(
  //               height: 20,
  //               width: 200,
  //               margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
  //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).shadowColor),
  //             ),
  //             const SizedBox(
  //               height: Dimensions.paddingSizeSmall,
  //             ),
  //             Container(
  //               height: 15,
  //               width: 250,
  //               margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: Theme.of(context).shadowColor,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: Dimensions.paddingSizeDefault * 2,
  //             ),
  //             SizedBox(
  //               height: 250,
  //               child: ListView.builder(
  //                 itemCount: ResponsiveHelper.isDesktop(context) ? 3 : 1,
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   return SizedBox(
  //                     width: ResponsiveHelper.isDesktop(context)
  //                         ? (Dimensions.webMaxWidth - 20));