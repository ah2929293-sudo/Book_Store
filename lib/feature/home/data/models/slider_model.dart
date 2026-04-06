class SliderModel {
  Data? data;
  String? message;
  List<String>? error;
  int? status;

  SliderModel({this.data, this.message, this.error, this.status});

  SliderModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = List<String>.from(json['error']);
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap['data'] = data!.toJson();
    }
    dataMap['message'] = message;
    if (error != null) {
      dataMap['error'] = error;
    }
    dataMap['status'] = status;
    return dataMap;
  }
}

class Data {
  List<Sliders>? sliders;

  Data({this.sliders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = (json['sliders'] as List)
          .map((v) => Sliders.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    if (sliders != null) {
      dataMap['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class Sliders {
  String? image;

  Sliders({this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {'image': image};
  }
}
