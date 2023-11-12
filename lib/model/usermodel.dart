class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  String? geoLat;
  String? geoLng;
  String? phone;
  String? profileImage;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geoLat,
    this.geoLng,
    this.phone,
    this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    street = json['address']['street'];
    suite = json['address']['suite'];
    city = json['address']['city'];
    zipcode = json['address']['zipcode'];
    geoLat = json['address']['geo']['lat'];
    geoLng = json['address']['geo']['lng'];
    phone = json['phone'];
    profileImage = 'https://picsum.photos/id/${json['id']}/200/300';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name ?? '';
    data['username'] = username ?? '';
    data['email'] = email ?? '';
    data['street'] = street ?? '';
    data['suite'] = suite ?? '';
    data['city'] = city ?? '';
    data['zipcode'] = zipcode ?? '';
    data['geoLat'] = geoLat ?? '';
    data['geoLng'] = geoLng ?? '';
    data['phone'] = phone ?? '';
    data['profileImage'] = profileImage ?? '';
    return data;
  }
}
