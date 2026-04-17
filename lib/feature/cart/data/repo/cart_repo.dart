import 'package:book_store/core/networking/api_constants.dart';
import 'package:book_store/core/networking/dio_helper.dart';

class CartRepo {
  static Future<bool> addToCart(int productId) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": productId},
      );

      if (response?.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
