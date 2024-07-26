
class Location{
  int? id;
  String? city;
  String? state;
  String? country;
  double? lat;
  double? lon;
  bool isChecked=false;

  Location({this.city, this.state, this.country, this.lat, this.lon});

  // Location.fromJson(Map<String,dynamic> json){
  //   // id=json['id'];
  //   city=json['city'];
  //   state=json['state'];
  //   country=json['country'];
  //   lat=json['lat'].toDouble();
  //   lon=json['lng'].toDouble();
  // }
 factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      lat: double.parse(json['lat']),
      lon: double.parse(json['lng']),
    );
  }

  String displayname(){
    return '$city-$country';
  }
}