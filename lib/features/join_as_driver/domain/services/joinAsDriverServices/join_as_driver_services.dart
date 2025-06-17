import 'package:shella_design/features/join_as_driver/domain/models/join_as_driver_model.dart';
import 'package:shella_design/features/join_as_driver/domain/repositories/joinAsDriverRepositioryInterface/join_as_driver_repositiory_interface.dart';
class DeliveryManService {
  final DeliveryManRepositoryInterface repository;

  DeliveryManService(this.repository);

  Future<bool> register(DeliveryManBody deliveryManBody) {
    return repository.registerDeliveryMan(deliveryManBody);
  }
}