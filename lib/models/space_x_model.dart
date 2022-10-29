import 'dart:convert';

class SpaceXModel {
  SpaceXModel(
      {required this.height,
      required this.diameter,
      required this.mass,
      required this.flickr_images,
      required this.name,
      required this.type,
      required this.active,
      required this.stages,
      required this.boosters,
      required this.costPerLaunch,
      required this.successRatePct,
      required this.firstFlight,
      required this.country,
      required this.company,
      required this.wikipedia,
      required this.description,
      required this.id,
      required this.isFavourite});
  String height;
  String diameter;
  String mass;
  String flickr_images;
  String name;
  String type;
  int active;
  int stages;
  int boosters;
  int costPerLaunch;
  int successRatePct;
  String firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;
  int isFavourite;
  
  factory SpaceXModel.fromJson(Map<String, dynamic> jsonData) {
    return SpaceXModel(
      height: json.encode(jsonData['height']),
      diameter: json.encode(jsonData['diameter']),
      mass: json.encode(jsonData["mass"]),
      flickr_images: jsonData["flickr_images"].toString(),
      name: jsonData["name"],
      type: jsonData["type"],
      active: jsonData["active"] == true ? 1 : 0,
      stages: jsonData["stages"],
      boosters: jsonData["boosters"],
      costPerLaunch: jsonData["cost_per_launch"],
      successRatePct: jsonData["success_rate_pct"],
      firstFlight: DateTime.parse(jsonData["first_flight"]).toString(),
      country: jsonData["country"],
      company: jsonData["company"],
      wikipedia: jsonData["wikipedia"],
      description: jsonData["description"],
      id: jsonData["id"],
      isFavourite: jsonData["isFavourite"] ?? 0 ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "height": height,
      "diameter": diameter,
      "mass": mass,
      'flickr_images': flickr_images,
      "name": name,
      "type": type,
      "active": active,
      "stages": stages,
      "boosters": boosters,
      "cost_per_launch": costPerLaunch,
      "success_rate_pct": successRatePct,
      "first_flight": firstFlight,
      "country": country,
      "company": company,
      "wikipedia": wikipedia,
      "description": description,
      'isFavourite' :isFavourite,
      "id": id,
    };
  }
}
