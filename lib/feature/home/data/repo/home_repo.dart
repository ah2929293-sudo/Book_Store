import 'package:book_store/core/networking/api_constants.dart';
import 'package:book_store/core/networking/dio_helper.dart';
import 'package:book_store/feature/home/data/models/slider_model.dart';

class HomeRepo {
  static Future<SliderModel?> getSlider() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.sliders);
      if (response?.statusCode == 200) {
        SliderModel data = SliderModel.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
