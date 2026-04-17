import 'package:book_store/core/networking/api_constants.dart';
import 'package:book_store/core/networking/dio_helper.dart';
import 'package:book_store/feature/home/data/models/best_seller_model.dart';

class SearchRepo {
  static Future<BestSellerModel?> search({required String text}) async {
    try {
      final response = await DioHelper.dio?.get(
        ApiConstants.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        BestSellerModel data = BestSellerModel.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
