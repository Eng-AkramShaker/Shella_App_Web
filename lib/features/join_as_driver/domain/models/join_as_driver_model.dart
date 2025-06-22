class DeliveryManBody {
  final String fName;
  final String lName;
  final String phone;
  final String email;
  final String password;
  final String identityType;
  final String identityNumber;
 // final int earning;
  final int zoneId;
  //final int vehicleId;
  final String imagePath; // path to photo on phone

  DeliveryManBody({ 
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
    required this.imagePath,
  });
}

