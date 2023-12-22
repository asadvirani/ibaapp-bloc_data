import 'package:ibaapp/core/network.dart';
import 'package:ibaapp/models/user_model.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Future<List<ProductModel>> getuser() async {
    return userApiClient.fetchuser();
  }
 
}
