class ClassModel {
  final String className;
  final double price;
  final int load;
  final List<String> features;

  ClassModel({
    required this.className,
    required this.price,
    required this.load,
    required this.features,
  });

  factory ClassModel.fromJson(jsonData) {
    List<String>? features = [];
      for (int i = 0; i < jsonData['features'].length; i++) {
        features.add(jsonData['features'][i]);
      }
    
    return ClassModel(
      className: jsonData['name'],
      price: jsonData['price'],
      load: jsonData['weight'],
      features: features,
    );
  }
}
