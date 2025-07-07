import 'package:shella_design/features/join_as_driver/domain/models/join_as_driver_model.dart';

abstract class DeliveryManRepositoryInterface{
  Future<bool> registerDeliveryMan(DeliveryManBody deliveryManBody);
}