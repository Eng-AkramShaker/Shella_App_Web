import 'package:shella_design/features/cart/widgets/mobile/cart_item.dart';
import 'package:shella_design/common/util/app_images.dart';
import '../../features/my_points/widgets/mobile/offers_mobile.dart';

List<CartItems> items = [
  CartItems(
      name: 'شاي ليبتون',
      description: 'عرض 35 ظرف + 5 هدية',
      price: 10,
      quantity: 1,
      img: AppImages.item_25),
  CartItems(
      name: 'شاي ليبتون',
      description: 'عرض 35 ظرف + 5 هدية',
      price: 10,
      quantity: 1,
      img: AppImages.item_26),
  CartItems(
      name: 'شاي ليبتون',
      description: 'عرض 35 ظرف + 5 هدية',
      price: 10,
      quantity: 1,
      img: AppImages.item_27),
];
List<Offers> itemsOfOffers = [
  Offers(
      title: 'خصم 10.00 ر.س على بيغ تيستي',
      image: 'assets/images/im4.png',
      offer: 'خصم  10.00 ر.س',
      point: '600 نقطة'),
  Offers(
      title: 'خصم 05.00 ر.س على برغر كينغ',
      image: 'assets/images/im1.png',
      offer: 'خصم  05.00 ر.س',
      point: '300 نقطة'),
  Offers(
      title: 'خصم 15.00 ر.س على حلي الورد',
      image: 'assets/images/im2.png',
      offer: 'خصم  15.00 ر.س',
      point: '800 نقطة'),
  Offers(
      title: 'خصم 15.00 ر.س على حلي الورد',
      image: 'assets/images/im3.png',
      offer: 'خصم  15.00 ر.س',
      point: '800 نقطة'),
  Offers(
      title: 'خصم 10.00 ر.س على بيغ تيستي',
      image: 'assets/images/im4.png',
      offer: 'خصم  10.00 ر.س',
      point: '600 نقطة'),
  Offers(
      title: 'خصم 05.00 ر.س على برغر كينغ',
      image: 'assets/images/im1.png',
      offer: 'خصم  05.00 ر.س',
      point: '300 نقطة'),
  Offers(
      title: 'خصم 15.00 ر.س على حلي الورد',
      image: 'assets/images/im2.png',
      offer: 'خصم  15.00 ر.س',
      point: '800 نقطة'),
  Offers(
      title: 'خصم 15.00 ر.س على حلي الورد',
      image: 'assets/images/im3.png',
      offer: 'خصم  15.00 ر.س',
      point: '800 نقطة'),
];
List<String> saudiCities = [
  "الرياض",
  "جدة",
  "مكة المكرمة",
  "المدينة المنورة",
  "الدمام",
  "الخبر",
  "الظهران",
  "الطائف",
  "بريدة",
  "خميس مشيط",
  "تبوك",
  "أبها",
  "نجران",
  "جازان",
  "حائل",
  "الباحة",
  "سكاكا",
  "الجوف",
  "القطيف",
  "الأحساء",
  "ينبع",
  "القنفذة",
  "الليث",
  "رابغ",
  "ضباء",
  "عرعر",
  "عنيزة",
  "صبيا",
  "بيشة",
  "الدوادمي",
  "الرس",
  "وادي الدواسر",
  "سراة عبيدة",
  "تثليث",
  "محايل عسير",
  "ظهران الجنوب",
  "طريف",
  "رفحاء",
  "شرورة",
  "الحوية",
  "المجمعة",
  "الغاط",
  "حوطة بني تميم",
  "الحريق",
  "ضرما",
  "المزاحمية",
  "ثادق",
  "عفيف",
  "السليل",
  "الدرعية",
  "الثقبة",
  "الفريش",
  "القريات",
  "تيماء",
  "أملج",
  "الوجه",
  "ضبا",
  "حقل",
  "البدع",
];
List<Map<String, dynamic>> nationalities = [
  {"name": 'اختر الجنسية', 'code': '', 'flag': ''},
  // الدول العربية
  {'name': 'Algerian', 'code': 'DZ', 'flag': '🇩🇿'},
  {'name': 'Bahraini', 'code': 'BH', 'flag': '🇧🇭'},
  {'name': 'Comorian', 'code': 'KM', 'flag': '🇰🇲'},
  {'name': 'Djiboutian', 'code': 'DJ', 'flag': '🇩🇯'},
  {'name': 'Egyptian', 'code': 'EG', 'flag': '🇪🇬'},
  {'name': 'Iraqi', 'code': 'IQ', 'flag': '🇮🇶'},
  {'name': 'Jordanian', 'code': 'JO', 'flag': '🇯🇴'},
  {'name': 'Kuwaiti', 'code': 'KW', 'flag': '🇰🇼'},
  {'name': 'Lebanese', 'code': 'LB', 'flag': '🇱🇧'},
  {'name': 'Libyan', 'code': 'LY', 'flag': '🇱🇾'},
  {'name': 'Mauritanian', 'code': 'MR', 'flag': '🇲🇷'},
  {'name': 'Moroccan', 'code': 'MA', 'flag': '🇲🇦'},
  {'name': 'Omani', 'code': 'OM', 'flag': '🇴🇲'},
  {'name': 'Palestinian', 'code': 'PS', 'flag': '🇵🇸'},
  {'name': 'Qatari', 'code': 'QA', 'flag': '🇶🇦'},
  {'name': 'Saudi', 'code': 'SA', 'flag': '🇸🇦'},
  {'name': 'Somali', 'code': 'SO', 'flag': '🇸🇴'},
  {'name': 'Sudanese', 'code': 'SD', 'flag': '🇸🇩'},
  {'name': 'Syrian', 'code': 'SY', 'flag': '🇸🇾'},
  {'name': 'Tunisian', 'code': 'TN', 'flag': '🇹🇳'},
  {'name': 'Emirati', 'code': 'AE', 'flag': '🇦🇪'},
  {'name': 'Yemeni', 'code': 'YE', 'flag': '🇾🇪'},

  // دول رئيسية أخرى
  {'name': 'American', 'code': 'US', 'flag': '🇺🇸'},
  {'name': 'Australian', 'code': 'AU', 'flag': '🇦🇺'},
  {'name': 'Brazilian', 'code': 'BR', 'flag': '🇧🇷'},
  {'name': 'British', 'code': 'GB', 'flag': '🇬🇧'},
  {'name': 'Canadian', 'code': 'CA', 'flag': '🇨🇦'},
  {'name': 'Chinese', 'code': 'CN', 'flag': '🇨🇳'},
  {'name': 'French', 'code': 'FR', 'flag': '🇫🇷'},
  {'name': 'German', 'code': 'DE', 'flag': '🇩🇪'},
  {'name': 'Indian', 'code': 'IN', 'flag': '🇮🇳'},
  {'name': 'Italian', 'code': 'IT', 'flag': '🇮🇹'},
  {'name': 'Japanese', 'code': 'JP', 'flag': '🇯🇵'},
  {'name': 'Russian', 'code': 'RU', 'flag': '🇷🇺'},
  {'name': 'South African', 'code': 'ZA', 'flag': '🇿🇦'},
  {'name': 'Spanish', 'code': 'ES', 'flag': '🇪🇸'},
  {'name': 'Turkish', 'code': 'TR', 'flag': '🇹🇷'},
];

List<int> img = [7, 8, 2, 1];
List<String> title = ["خدمة تخدمني", "استلام وتسليم", "المطاعم", "سوبر ماركت"];

List<String> discountsTypes=["الكل","عرض الحزم","العناية الشخصية", "المثلجات"];

final List<Map<String,dynamic>> categories=[
  {
     "name":"السندويش",
     "image":"assets/images/9.png"
  },
  {
   "name":"البيتزا",
  "image":"assets/images/19.png"

  },
  {
  "name":"المشروبات",
  "image":"assets/images/20.png"

  }

];

final List<Map<String,dynamic>> discounts =[

  {
    "id":1,
    "name": "داجستيف بيسكويت",
    "image": "assets/images/dagestiv.jpg",
    "price": 15.0 ,
    "discount" :25.0
  },

  {
    "id":2,
    "name": "عرض رز الذرة",
    "image": "assets/images/rice.jpg",
    "price": 15.0,
    "discount":25.0
  },
  {
    "id":3,
    "name":"عرض نسكافيه 3*1" ,
    "image": "assets/images/nescavie.png",
    "price": 20.0 ,
    "discount":25.0
  },
  {
    "id":4,
    "name": "ليبتون 48 ظروف",
    "image": "assets/images/libton.png",
    "price": 10.0 ,
    "discount":17.0
  },
  {
    "id":5,
    "name": "زيت مازولا 2 ليتر",
    "image": "assets/images/mazola.jpg",
    "price": 10.0 ,
    "discount": 20.0
  },
  {
    "id":6,
    "name":"نوتيلا 500 غرام" ,
    "image": "assets/images/nutella.jpg",
    "price": 20.0,
    "discount":35.0
  },
  {
    "id":7,
    "name":"شاي الوزة 400 غرام" ,
    "image": "assets/images/tea.png",
    "price": 10.0,
    "discount":20.0
  },
  {
    "id":1,
    "name": "برينغلز كبير",
    "image": "assets/images/pringles.jpg",
    "price": 7.0,
    "discount":10.0
  }
];

final List<Map<String, dynamic>> orders = [
  {
    "name": "بيتزا هت 100200#",
    "logo": AppImages.res_4,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
  {
    "name": "برغر كينغ 123456#",
    "logo": AppImages.res_4,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
  {
    "name": "جو كرسبي 678889#",
    "logo": AppImages.res_34,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
];

final List<Map<String, dynamic>> market = [
  {
    "name": "ماركت الخير 100200#",
    "logo": AppImages.market_32,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
  {
    "name": "ماركت النور 123456#",
    "logo": AppImages.market_31,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
  {
    "name": "ماركت كافور 678889#",
    "logo": AppImages.market_31,
    "status": "قيد الموافقة",
    "date": "Jan 2024 16:03",
  },
];
