class ProfileModel {
  final String id;
  final String email;
  final String name;
  final String phone;
  final int avaterId;

  ProfileModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.avaterId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    return ProfileModel(
      id: data['_id'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      avaterId: data['avaterId'] ?? 0 ,
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      "_id": id,
      "email": email,
      "name": name,
      "phone": phone,
      "avaterId" : avaterId,
    };
    return map;
  }

}
