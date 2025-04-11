class DeliveryAddressModel {
  final String id;
  final String title;
  final String address;

  DeliveryAddressModel({
    required this.id,
    required this.title,
    required this.address,
  });

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    return DeliveryAddressModel(
      id: json['id'],
      title: json['title'],
      address: json['address'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
    };
  }
}
