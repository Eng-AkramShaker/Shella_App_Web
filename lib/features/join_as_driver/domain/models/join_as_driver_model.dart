class DeliveryManBody {
  final String licenseImagePath;
  final String fName;
  final String lName;
  final String phone;
  final String email;
  final String password;
  final String identityType;
  final String identityNumber;
  final String earning;
  final String zoneId;
  final String vehicleId;
  final String imagePathProfile; // path to photo on phone

  DeliveryManBody({
    required this.licenseImagePath,
    required this.vehicleId,
    required this.earning,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    required this.password,
    required this.identityType,
    required this.identityNumber,
    //required this.earning,
    required this.zoneId,
    //required this.vehicleId,
    required this.imagePathProfile,
  });
}
