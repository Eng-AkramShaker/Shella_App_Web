import 'package:flutter/material.dart';
import 'package:shella_design/common/enums/data_source_enum.dart';
import 'package:shella_design/features/advertisment/domain/advertisment_service.dart';
import 'package:shella_design/features/advertisment/model/advertisment_model.dart'; // استورد الخدمة الجديدة
import 'package:provider/provider.dart'; // ستحتاج لهذه المكتبة

class AdvertisementProvider extends ChangeNotifier {
  final HttpAdvertisementService advertisementService;
  // تمت إزالة final HomeController? homeController;

  AdvertisementProvider(
      {required this.advertisementService}); // تم تحديث constructor

  List<AdvertisementModel>? _advertisementList;
  List<AdvertisementModel>? get advertisementList => _advertisementList;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  Duration autoPlayDuration = const Duration(seconds: 7);

  bool autoPlay = true;

  Future<void> getAdvertisementList(
      {DataSourceEnum dataSource = DataSourceEnum.client,
      int? moduleId}) async {
    // تم حذف: final businessSettings = homeController?.business_Settings;
    // تم حذف: if (businessSettings?.advertisementListSection?.toString() == "1") {

    List<AdvertisementModel>? responseAdvertisement;

    // بما أن HttpAdvertisementService يتصل بالـ API مباشرة،
    // فإن dataSource هنا قد لا يكون له نفس الأهمية.
    // ستقوم الدالة دائمًا بإجراء طلب API.
    // currentModuleId يجب أن يتم تمريره أو الحصول عليه من مصدر آخر.
    // هنا، نستخدم moduleId الممرر للدالة، أو قيمة افتراضية 3 إذا كان null.
    responseAdvertisement = await advertisementService
        .getAdvertisementList(dataSource, moduleId: moduleId ?? 3);

    if (responseAdvertisement != null) {
      _advertisementList = responseAdvertisement;
      print("Advertisements loaded: ${_advertisementList?.length} items");
    } else {
      _advertisementList = []; // تفريغ القائمة في حالة الفشل
      print("Failed to load advertisements or response was empty.");
    }
    notifyListeners();
    // تم حذف: } else { ... }
  }

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      notifyListeners();
    }
  }

  void updateAutoPlayStatus({bool shouldUpdate = false, bool status = false}) {
    autoPlay = status;
    if (shouldUpdate) {
      notifyListeners();
    }
  }
}
