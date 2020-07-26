class WordNameModel {
  String name;
  String alpha2code;
  String alpha3code;
  double latitude;
  double longitude;

  WordNameModel(
      {this.name,
      this.alpha2code,
      this.alpha3code,
      this.latitude,
      this.longitude});

  WordNameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alpha2code = json['alpha2code'];
    alpha3code = json['alpha3code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alpha2code'] = this.alpha2code;
    data['alpha3code'] = this.alpha3code;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
