class ConfigModel {
  ConfigModel({
    required this.businessName,
    required this.logo,
    required this.logoFullUrl,
    required this.address,
    required this.phone,
    required this.email,
    required this.country,
    required this.defaultLocation,
    required this.currencySymbol,
    required this.currencySymbolDirection,
    required this.appMinimumVersionAndroid,
    required this.appUrlAndroid,
    required this.appUrlIos,
    required this.appMinimumVersionIos,
    required this.appMinimumVersionAndroidStore,
    required this.appUrlAndroidStore,
    required this.appMinimumVersionIosStore,
    required this.appUrlIosStore,
    required this.appMinimumVersionAndroidDeliveryman,
    required this.appUrlAndroidDeliveryman,
    required this.appMinimumVersionIosDeliveryman,
    required this.appUrlIosDeliveryman,
    required this.customerVerification,
    required this.prescriptionOrderStatus,
    required this.scheduleOrder,
    required this.orderDeliveryVerification,
    required this.cashOnDelivery,
    required this.digitalPayment,
    required this.digitalPaymentInfo,
    required this.perKmShippingCharge,
    required this.minimumShippingCharge,
    required this.freeDeliveryOver,
    required this.demo,
    required this.maintenanceMode,
    required this.orderConfirmationModel,
    required this.showDmEarning,
    required this.canceledByDeliveryman,
    required this.canceledByStore,
    required this.timeformat,
    required this.language,
    required this.sysLanguage,
    required this.socialLogin,
    required this.appleLogin,
    required this.toggleVegNonVeg,
    required this.toggleDmRegistration,
    required this.toggleStoreRegistration,
    required this.refundActiveStatus,
    required this.scheduleOrderSlotDuration,
    required this.digitAfterDecimalPoint,
    required this.moduleConfig,
    required this.module,
    required this.parcelPerKmShippingCharge,
    required this.parcelMinimumShippingCharge,
    required this.socialMedia,
    required this.footerText,
    required this.cookiesText,
    required this.favIcon,
    required this.favIconFullUrl,
    required this.landingPageLinks,
    required this.dmTipsStatus,
    required this.loyaltyPointExchangeRate,
    required this.loyaltyPointItemPurchasePoint,
    required this.loyaltyPointStatus,
    required this.customerWalletStatus,
    required this.walletQidhaStatus,
    required this.refEarningStatus,
    required this.refEarningExchangeRate,
    required this.refundPolicy,
    required this.cancelationPolicy,
    required this.shippingPolicy,
    required this.loyaltyPointMinimumPoint,
    required this.taxIncluded,
    required this.homeDeliveryStatus,
    required this.takeawayStatus,
    required this.activePaymentMethodList,
    required this.additionalChargeStatus,
    required this.additionalChargeName,
    required this.additionalCharge,
    required this.partialPaymentStatus,
    required this.partialPaymentMethod,
    required this.dmPictureUploadStatus,
    required this.addFundStatus,
    required this.offlinePaymentStatus,
    required this.websocketStatus,
    required this.websocketUrl,
    required this.websocketPort,
    required this.websocketKey,
    required this.guestCheckoutStatus,
    required this.disbursementType,
    required this.restaurantDisbursementWaitingTime,
    required this.dmDisbursementWaitingTime,
    required this.minAmountToPayStore,
    required this.minAmountToPayDm,
    required this.newCustomerDiscountStatus,
    required this.newCustomerDiscountAmount,
    required this.newCustomerDiscountAmountType,
    required this.newCustomerDiscountAmountValidity,
    required this.newCustomerDiscountValidityType,
    required this.storeReviewReply,
    required this.adminCommission,
    required this.subscriptionBusinessModel,
    required this.commissionBusinessModel,
    required this.subscriptionDeadlineWarningDays,
    required this.subscriptionDeadlineWarningMessage,
    required this.subscriptionFreeTrialDays,
    required this.subscriptionFreeTrialType,
    required this.subscriptionFreeTrialStatus,
    required this.countryPickerStatus,
    required this.externalSystem,
    required this.drivemondAppUrlAndroid,
    required this.drivemondAppUrlIos,
    required this.firebaseOtpVerification,
    required this.centralizeLogin,
    required this.vehicleDistanceMin,
    required this.vehicleHourlyMin,
  });

  final String? businessName;
  final String? logo;
  final String? logoFullUrl;
  final String? address;
  final String? phone;
  final String? email;
  final String? country;
  final DefaultLocation? defaultLocation;
  final String? currencySymbol;
  final String? currencySymbolDirection;
  final int? appMinimumVersionAndroid;
  final dynamic appUrlAndroid;
  final dynamic appUrlIos;
  final int? appMinimumVersionIos;
  final int? appMinimumVersionAndroidStore;
  final dynamic appUrlAndroidStore;
  final int? appMinimumVersionIosStore;
  final dynamic appUrlIosStore;
  final int? appMinimumVersionAndroidDeliveryman;
  final dynamic appUrlAndroidDeliveryman;
  final int? appMinimumVersionIosDeliveryman;
  final dynamic appUrlIosDeliveryman;
  final bool? customerVerification;
  final bool? prescriptionOrderStatus;
  final bool? scheduleOrder;
  final bool? orderDeliveryVerification;
  final bool? cashOnDelivery;
  final bool? digitalPayment;
  final DigitalPaymentInfo? digitalPaymentInfo;
  final int? perKmShippingCharge;
  final int? minimumShippingCharge;
  final dynamic freeDeliveryOver;
  final bool? demo;
  final bool? maintenanceMode;
  final String? orderConfirmationModel;
  final bool? showDmEarning;
  final bool? canceledByDeliveryman;
  final bool? canceledByStore;
  final String? timeformat;
  final List<Language> language;
  final List<SysLanguage> sysLanguage;
  final List<SocialLogin> socialLogin;
  final List<AppleLogin> appleLogin;
  final bool? toggleVegNonVeg;
  final bool? toggleDmRegistration;
  final bool? toggleStoreRegistration;
  final bool? refundActiveStatus;
  final int? scheduleOrderSlotDuration;
  final int? digitAfterDecimalPoint;
  final ModuleConfig? moduleConfig;
  final dynamic module;
  final int? parcelPerKmShippingCharge;
  final int? parcelMinimumShippingCharge;
  final List<dynamic> socialMedia;
  final String? footerText;
  final String? cookiesText;
  final String? favIcon;
  final String? favIconFullUrl;
  final LandingPageLinks? landingPageLinks;
  final int? dmTipsStatus;
  final int? loyaltyPointExchangeRate;
  final int? loyaltyPointItemPurchasePoint;
  final int? loyaltyPointStatus;
  final int? customerWalletStatus;
  final int? walletQidhaStatus;
  final int? refEarningStatus;
  final int? refEarningExchangeRate;
  final int? refundPolicy;
  final int? cancelationPolicy;
  final int? shippingPolicy;
  final int? loyaltyPointMinimumPoint;
  final int? taxIncluded;
  final int? homeDeliveryStatus;
  final int? takeawayStatus;
  final List<dynamic> activePaymentMethodList;
  final int? additionalChargeStatus;
  final String? additionalChargeName;
  final int? additionalCharge;
  final int? partialPaymentStatus;
  final String? partialPaymentMethod;
  final int? dmPictureUploadStatus;
  final int? addFundStatus;
  final int? offlinePaymentStatus;
  final int? websocketStatus;
  final String? websocketUrl;
  final int? websocketPort;
  final dynamic websocketKey;
  final int? guestCheckoutStatus;
  final String? disbursementType;
  final int? restaurantDisbursementWaitingTime;
  final int? dmDisbursementWaitingTime;
  final int? minAmountToPayStore;
  final int? minAmountToPayDm;
  final int? newCustomerDiscountStatus;
  final int? newCustomerDiscountAmount;
  final String? newCustomerDiscountAmountType;
  final int? newCustomerDiscountAmountValidity;
  final String? newCustomerDiscountValidityType;
  final int? storeReviewReply;
  final int? adminCommission;
  final int? subscriptionBusinessModel;
  final int? commissionBusinessModel;
  final int? subscriptionDeadlineWarningDays;
  final String? subscriptionDeadlineWarningMessage;
  final int? subscriptionFreeTrialDays;
  final String? subscriptionFreeTrialType;
  final int? subscriptionFreeTrialStatus;
  final int? countryPickerStatus;
  final bool? externalSystem;
  final String? drivemondAppUrlAndroid;
  final String? drivemondAppUrlIos;
  final int? firebaseOtpVerification;
  final CentralizeLogin? centralizeLogin;
  final int? vehicleDistanceMin;
  final int? vehicleHourlyMin;

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      businessName: json["business_name"],
      logo: json["logo"],
      logoFullUrl: json["logo_full_url"],
      address: json["address"],
      phone: json["phone"],
      email: json["email"],
      country: json["country"],
      defaultLocation: json["default_location"] == null ? null : DefaultLocation.fromJson(json["default_location"]),
      currencySymbol: json["currency_symbol"],
      currencySymbolDirection: json["currency_symbol_direction"],
      appMinimumVersionAndroid: json["app_minimum_version_android"],
      appUrlAndroid: json["app_url_android"],
      appUrlIos: json["app_url_ios"],
      appMinimumVersionIos: json["app_minimum_version_ios"],
      appMinimumVersionAndroidStore: json["app_minimum_version_android_store"],
      appUrlAndroidStore: json["app_url_android_store"],
      appMinimumVersionIosStore: json["app_minimum_version_ios_store"],
      appUrlIosStore: json["app_url_ios_store"],
      appMinimumVersionAndroidDeliveryman: json["app_minimum_version_android_deliveryman"],
      appUrlAndroidDeliveryman: json["app_url_android_deliveryman"],
      appMinimumVersionIosDeliveryman: json["app_minimum_version_ios_deliveryman"],
      appUrlIosDeliveryman: json["app_url_ios_deliveryman"],
      customerVerification: json["customer_verification"],
      prescriptionOrderStatus: json["prescription_order_status"],
      scheduleOrder: json["schedule_order"],
      orderDeliveryVerification: json["order_delivery_verification"],
      cashOnDelivery: json["cash_on_delivery"],
      digitalPayment: json["digital_payment"],
      digitalPaymentInfo: json["digital_payment_info"] == null ? null : DigitalPaymentInfo.fromJson(json["digital_payment_info"]),
      perKmShippingCharge: json["per_km_shipping_charge"],
      minimumShippingCharge: json["minimum_shipping_charge"],
      freeDeliveryOver: json["free_delivery_over"],
      demo: json["demo"],
      maintenanceMode: json["maintenance_mode"],
      orderConfirmationModel: json["order_confirmation_model"],
      showDmEarning: json["show_dm_earning"],
      canceledByDeliveryman: json["canceled_by_deliveryman"],
      canceledByStore: json["canceled_by_store"],
      timeformat: json["timeformat"],
      language: json["language"] == null ? [] : List<Language>.from(json["language"]!.map((x) => Language.fromJson(x))),
      sysLanguage:
          json["sys_language"] == null ? [] : List<SysLanguage>.from(json["sys_language"]!.map((x) => SysLanguage.fromJson(x))),
      socialLogin:
          json["social_login"] == null ? [] : List<SocialLogin>.from(json["social_login"]!.map((x) => SocialLogin.fromJson(x))),
      appleLogin: json["apple_login"] == null ? [] : List<AppleLogin>.from(json["apple_login"]!.map((x) => AppleLogin.fromJson(x))),
      toggleVegNonVeg: json["toggle_veg_non_veg"],
      toggleDmRegistration: json["toggle_dm_registration"],
      toggleStoreRegistration: json["toggle_store_registration"],
      refundActiveStatus: json["refund_active_status"],
      scheduleOrderSlotDuration: json["schedule_order_slot_duration"],
      digitAfterDecimalPoint: json["digit_after_decimal_point"],
      moduleConfig: json["module_config"] == null ? null : ModuleConfig.fromJson(json["module_config"]),
      module: json["module"],
      parcelPerKmShippingCharge: json["parcel_per_km_shipping_charge"],
      parcelMinimumShippingCharge: json["parcel_minimum_shipping_charge"],
      socialMedia: json["social_media"] == null ? [] : List<dynamic>.from(json["social_media"]!.map((x) => x)),
      footerText: json["footer_text"],
      cookiesText: json["cookies_text"],
      favIcon: json["fav_icon"],
      favIconFullUrl: json["fav_icon_full_url"],
      landingPageLinks: json["landing_page_links"] == null ? null : LandingPageLinks.fromJson(json["landing_page_links"]),
      dmTipsStatus: json["dm_tips_status"],
      loyaltyPointExchangeRate: json["loyalty_point_exchange_rate"],
      loyaltyPointItemPurchasePoint: json["loyalty_point_item_purchase_point"],
      loyaltyPointStatus: json["loyalty_point_status"],
      customerWalletStatus: json["customer_wallet_status"],
      walletQidhaStatus: json["wallet_qidha_status"],
      refEarningStatus: json["ref_earning_status"],
      refEarningExchangeRate: json["ref_earning_exchange_rate"],
      refundPolicy: json["refund_policy"],
      cancelationPolicy: json["cancelation_policy"],
      shippingPolicy: json["shipping_policy"],
      loyaltyPointMinimumPoint: json["loyalty_point_minimum_point"],
      taxIncluded: json["tax_included"],
      homeDeliveryStatus: json["home_delivery_status"],
      takeawayStatus: json["takeaway_status"],
      activePaymentMethodList:
          json["active_payment_method_list"] == null ? [] : List<dynamic>.from(json["active_payment_method_list"]!.map((x) => x)),
      additionalChargeStatus: json["additional_charge_status"],
      additionalChargeName: json["additional_charge_name"],
      additionalCharge: json["additional_charge"],
      partialPaymentStatus: json["partial_payment_status"],
      partialPaymentMethod: json["partial_payment_method"],
      dmPictureUploadStatus: json["dm_picture_upload_status"],
      addFundStatus: json["add_fund_status"],
      offlinePaymentStatus: json["offline_payment_status"],
      websocketStatus: json["websocket_status"],
      websocketUrl: json["websocket_url"],
      websocketPort: json["websocket_port"],
      websocketKey: json["websocket_key"],
      guestCheckoutStatus: json["guest_checkout_status"],
      disbursementType: json["disbursement_type"],
      restaurantDisbursementWaitingTime: json["restaurant_disbursement_waiting_time"],
      dmDisbursementWaitingTime: json["dm_disbursement_waiting_time"],
      minAmountToPayStore: json["min_amount_to_pay_store"],
      minAmountToPayDm: json["min_amount_to_pay_dm"],
      newCustomerDiscountStatus: json["new_customer_discount_status"],
      newCustomerDiscountAmount: json["new_customer_discount_amount"],
      newCustomerDiscountAmountType: json["new_customer_discount_amount_type"],
      newCustomerDiscountAmountValidity: json["new_customer_discount_amount_validity"],
      newCustomerDiscountValidityType: json["new_customer_discount_validity_type"],
      storeReviewReply: json["store_review_reply"],
      adminCommission: json["admin_commission"],
      subscriptionBusinessModel: json["subscription_business_model"],
      commissionBusinessModel: json["commission_business_model"],
      subscriptionDeadlineWarningDays: json["subscription_deadline_warning_days"],
      subscriptionDeadlineWarningMessage: json["subscription_deadline_warning_message"],
      subscriptionFreeTrialDays: json["subscription_free_trial_days"],
      subscriptionFreeTrialType: json["subscription_free_trial_type"],
      subscriptionFreeTrialStatus: json["subscription_free_trial_status"],
      countryPickerStatus: json["country_picker_status"],
      externalSystem: json["external_system"],
      drivemondAppUrlAndroid: json["drivemond_app_url_android"],
      drivemondAppUrlIos: json["drivemond_app_url_ios"],
      firebaseOtpVerification: json["firebase_otp_verification"],
      centralizeLogin: json["centralize_login"] == null ? null : CentralizeLogin.fromJson(json["centralize_login"]),
      vehicleDistanceMin: json["vehicle_distance_min"],
      vehicleHourlyMin: json["vehicle_hourly_min"],
    );
  }
}

class AppleLogin {
  AppleLogin({
    required this.loginMedium,
    required this.status,
    required this.clientId,
    required this.clientIdApp,
    required this.redirectUrlFlutter,
    required this.redirectUrlReact,
  });

  final String? loginMedium;
  final bool? status;
  final String? clientId;
  final String? clientIdApp;
  final String? redirectUrlFlutter;
  final String? redirectUrlReact;

  factory AppleLogin.fromJson(Map<String, dynamic> json) {
    return AppleLogin(
      loginMedium: json["login_medium"],
      status: json["status"],
      clientId: json["client_id"],
      clientIdApp: json["client_id_app"],
      redirectUrlFlutter: json["redirect_url_flutter"],
      redirectUrlReact: json["redirect_url_react"],
    );
  }
}

class CentralizeLogin {
  CentralizeLogin({
    required this.manualLoginStatus,
    required this.otpLoginStatus,
    required this.socialLoginStatus,
    required this.googleLoginStatus,
    required this.facebookLoginStatus,
    required this.appleLoginStatus,
    required this.emailVerificationStatus,
    required this.phoneVerificationStatus,
  });

  final int? manualLoginStatus;
  final int? otpLoginStatus;
  final int? socialLoginStatus;
  final int? googleLoginStatus;
  final int? facebookLoginStatus;
  final int? appleLoginStatus;
  final int? emailVerificationStatus;
  final int? phoneVerificationStatus;

  factory CentralizeLogin.fromJson(Map<String, dynamic> json) {
    return CentralizeLogin(
      manualLoginStatus: json["manual_login_status"],
      otpLoginStatus: json["otp_login_status"],
      socialLoginStatus: json["social_login_status"],
      googleLoginStatus: json["google_login_status"],
      facebookLoginStatus: json["facebook_login_status"],
      appleLoginStatus: json["apple_login_status"],
      emailVerificationStatus: json["email_verification_status"],
      phoneVerificationStatus: json["phone_verification_status"],
    );
  }
}

class DefaultLocation {
  DefaultLocation({
    required this.lat,
    required this.lng,
  });

  final String? lat;
  final String? lng;

  factory DefaultLocation.fromJson(Map<String, dynamic> json) {
    return DefaultLocation(
      lat: json["lat"],
      lng: json["lng"],
    );
  }
}

class DigitalPaymentInfo {
  DigitalPaymentInfo({
    required this.digitalPayment,
    required this.pluginPaymentGateways,
    required this.defaultPaymentGateways,
  });

  final bool? digitalPayment;
  final bool? pluginPaymentGateways;
  final bool? defaultPaymentGateways;

  factory DigitalPaymentInfo.fromJson(Map<String, dynamic> json) {
    return DigitalPaymentInfo(
      digitalPayment: json["digital_payment"],
      pluginPaymentGateways: json["plugin_payment_gateways"],
      defaultPaymentGateways: json["default_payment_gateways"],
    );
  }
}

class LandingPageLinks {
  LandingPageLinks({
    required this.appUrlAndroidStatus,
    required this.appUrlAndroid,
    required this.appUrlIosStatus,
    required this.appUrlIos,
    required this.webAppUrlStatus,
    required this.webAppUrl,
  });

  final String? appUrlAndroidStatus;
  final String? appUrlAndroid;
  final String? appUrlIosStatus;
  final String? appUrlIos;
  final String? webAppUrlStatus;
  final String? webAppUrl;

  factory LandingPageLinks.fromJson(Map<String, dynamic> json) {
    return LandingPageLinks(
      appUrlAndroidStatus: json["app_url_android_status"],
      appUrlAndroid: json["app_url_android"],
      appUrlIosStatus: json["app_url_ios_status"],
      appUrlIos: json["app_url_ios"],
      webAppUrlStatus: json["web_app_url_status"],
      webAppUrl: json["web_app_url"],
    );
  }
}

class Language {
  Language({
    required this.key,
    required this.value,
  });

  final String? key;
  final String? value;

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      key: json["key"],
      value: json["value"],
    );
  }
}

class ModuleConfig {
  ModuleConfig({
    required this.moduleType,
    required this.grocery,
    required this.food,
    required this.pharmacy,
    required this.ecommerce,
    required this.parcel,
    required this.rental,
  });

  final List<String> moduleType;
  final Ecommerce? grocery;
  final Ecommerce? food;
  final Ecommerce? pharmacy;
  final Ecommerce? ecommerce;
  final Ecommerce? parcel;
  final Ecommerce? rental;

  factory ModuleConfig.fromJson(Map<String, dynamic> json) {
    return ModuleConfig(
      moduleType: json["module_type"] == null ? [] : List<String>.from(json["module_type"]!.map((x) => x)),
      grocery: json["grocery"] == null ? null : Ecommerce.fromJson(json["grocery"]),
      food: json["food"] == null ? null : Ecommerce.fromJson(json["food"]),
      pharmacy: json["pharmacy"] == null ? null : Ecommerce.fromJson(json["pharmacy"]),
      ecommerce: json["ecommerce"] == null ? null : Ecommerce.fromJson(json["ecommerce"]),
      parcel: json["parcel"] == null ? null : Ecommerce.fromJson(json["parcel"]),
      rental: json["rental"] == null ? null : Ecommerce.fromJson(json["rental"]),
    );
  }
}

class Ecommerce {
  Ecommerce({
    required this.orderStatus,
    required this.orderPlaceToScheduleInterval,
    required this.addOn,
    required this.stock,
    required this.vegNonVeg,
    required this.unit,
    required this.orderAttachment,
    required this.alwaysOpen,
    required this.allZoneService,
    required this.itemAvailableTime,
    required this.showRestaurantText,
    required this.isParcel,
    required this.organic,
    required this.cutlery,
    required this.commonCondition,
    required this.nutrition,
    required this.allergy,
    required this.basic,
    required this.halal,
    required this.brand,
    required this.ecommerceGenericName,
    required this.description,
    required this.isRental,
    required this.genericName,
  });

  final OrderStatus? orderStatus;
  final bool? orderPlaceToScheduleInterval;
  final bool? addOn;
  final bool? stock;
  final bool? vegNonVeg;
  final bool? unit;
  final bool? orderAttachment;
  final bool? alwaysOpen;
  final bool? allZoneService;
  final bool? itemAvailableTime;
  final bool? showRestaurantText;
  final bool? isParcel;
  final bool? organic;
  final bool? cutlery;
  final bool? commonCondition;
  final bool? nutrition;
  final bool? allergy;
  final bool? basic;
  final bool? halal;
  final bool? brand;
  final bool? ecommerceGenericName;
  final String? description;
  final bool? isRental;
  final bool? genericName;

  factory Ecommerce.fromJson(Map<String, dynamic> json) {
    return Ecommerce(
      orderStatus: json["order_status"] == null ? null : OrderStatus.fromJson(json["order_status"]),
      orderPlaceToScheduleInterval: json["order_place_to_schedule_interval"],
      addOn: json["add_on"],
      stock: json["stock"],
      vegNonVeg: json["veg_non_veg"],
      unit: json["unit"],
      orderAttachment: json["order_attachment"],
      alwaysOpen: json["always_open"],
      allZoneService: json["all_zone_service"],
      itemAvailableTime: json["item_available_time"],
      showRestaurantText: json["show_restaurant_text"],
      isParcel: json["is_parcel"],
      organic: json["organic"],
      cutlery: json["cutlery"],
      commonCondition: json["common_condition"],
      nutrition: json["nutrition"],
      allergy: json["allergy"],
      basic: json["basic"],
      halal: json["halal"],
      brand: json["brand"],
      ecommerceGenericName: json["generic_name"],
      description: json["description"],
      isRental: json["is_rental"],
      genericName: json["generic _name"],
    );
  }
}

class OrderStatus {
  OrderStatus({
    required this.accepted,
  });

  final bool? accepted;

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      accepted: json["accepted"],
    );
  }
}

class SocialLogin {
  SocialLogin({
    required this.loginMedium,
    required this.status,
  });

  final String? loginMedium;
  final bool? status;

  factory SocialLogin.fromJson(Map<String, dynamic> json) {
    return SocialLogin(
      loginMedium: json["login_medium"],
      status: json["status"],
    );
  }
}

class SysLanguage {
  SysLanguage({
    required this.key,
    required this.value,
    required this.direction,
    required this.sysLanguageDefault,
  });

  final String? key;
  final String? value;
  final String? direction;
  final bool? sysLanguageDefault;

  factory SysLanguage.fromJson(Map<String, dynamic> json) {
    return SysLanguage(
      key: json["key"],
      value: json["value"],
      direction: json["direction"],
      sysLanguageDefault: json["default"],
    );
  }
}
