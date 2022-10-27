// To parse this JSON data, do
//
//     final spaceXModel = spaceXModelFromJson(jsonString);

import 'dart:convert';

// SpaceXModel spaceXModelFromJson(String str) => SpaceXModel.fromJson(json.decode(str));

// String spaceXModelToJson(SpaceXModel data) => json.encode(data.toJson());

class SpaceXModel {
  SpaceXModel(
      {required this.height,
      required this.diameter,
      required this.mass,
      required this.flickrImages,
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

  Diameter height;
  Diameter diameter;
  Mass mass;
  List<String> flickrImages;
  String name;
  String type;
  bool active;
  int stages;
  int boosters;
  int costPerLaunch;
  int successRatePct;
  DateTime firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;
  bool isFavourite;

  /// ---- Getters ---- ///
  Diameter get height1 => height;
  Diameter get diameter1 => diameter;
  Mass get mass1 => mass;
  List<String> get flickerImages1 => flickrImages;
  String get name1 => name;
  String get type1 => type;
  bool get active1 => active;
  int get stages1 => stages;
  int get boosters1 => boosters;
  int get costPerLaunch1 => costPerLaunch;
  int get successRatePct1 => successRatePct;
  DateTime get firstFlight1 => firstFlight;
  String get country1 => country;
  String get company1 => company;
  String get wikipedia1 => wikipedia;
  String get description1 => description;
  // String  get id1=>id;
  bool get isFavourite1 => isFavourite;

  /// ---- Setters ---- ///
  set height1(Diameter newHeight) {
    height = newHeight;
  }

  set diameter1(Diameter newdiameter) {
    diameter = newdiameter;
  }

  set mass1(Mass newMass) {
    mass = newMass;
  }

  set flickerImages1(List<String> newFlickerImages) {
    flickrImages = newFlickerImages;
  }

  set name1(String newName) {
    name = newName;
  }

  set type1(String newType) {
    type = newType;
  }

  set active1(bool newActive) {
    active = newActive;
  }

  set stages1(int newStages) {
    stages = newStages;
  }

  set boosters1(int newBoosters) {
    boosters = newBoosters;
  }

  set costPerLaunch1(int newCostPerLaunch) {
    costPerLaunch = newCostPerLaunch;
  }

  set successRatePct1(int newSuccessRatePct) {
    successRatePct = newSuccessRatePct;
  }

  set firstFlight1(DateTime newFirstFlight) {
    firstFlight = newFirstFlight;
  }

  set country1(String newCountry) {
    country = newCountry;
  }

  set company1(String newCompany) {
    company = newCompany;
  }

  set wikipedia1(String newWikipedia) {
    wikipedia = newWikipedia;
  }

  set description1(String newDescription) {
    description = newDescription;
  }

  //  set id1(String newId){
  //   id = newId;
  //  }
  set isFavourite1(bool newFavourite) {
    isFavourite = newFavourite;
  }

  factory SpaceXModel.fromJson(Map<String, dynamic> json) => SpaceXModel(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
        mass: Mass.fromJson(json["mass"]),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        active: json["active"],
        stages: json["stages"],
        boosters: json["boosters"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        firstFlight: DateTime.parse(json["first_flight"]),
        country: json["country"],
        company: json["company"],
        wikipedia: json["wikipedia"],
        description: json["description"],
        id: json["id"],
        isFavourite: false,
      );

  Map<String, dynamic> toJson() => {
        "height": height.toJson(),
        "diameter": diameter.toJson(),
        "mass": mass.toJson(),
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "name": name,
        "type": type,
        "active": active,
        "stages": stages,
        "boosters": boosters,
        "cost_per_launch": costPerLaunch,
        "success_rate_pct": successRatePct,
        "first_flight":
            "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country,
        "company": company,
        "wikipedia": wikipedia,
        "description": description,
        "id": id,
      };
}

class Diameter {
  Diameter({
    required this.meters,
    required this.feet,
  });

  double meters;
  double feet;

  /// ---- Getters ---- ////
  double get meters1 => meters;
  double get feet1 => feet;

  /// ---- Setters ---- ///
  set meters1(double newMeters) {
    meters = newMeters;
  }

  set feet1(double newFeet) {
    feet = newFeet;
  }

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"].toDouble(),
        feet: json["feet"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "meters": meters,
        "feet": feet,
      };
}

class Mass {
  Mass({
    required this.kg,
    required this.lb,
  });

  int kg;
  int lb;

  /// ---- Getters ---- ///
  int get kg1 => kg;
  int get lb1 => lb;

  /// ---- Setters ---- ///
  set kg1(int newKg){
    kg = newKg;
  }
  set lb1(int newlb){
    kg = newlb;
  }

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toJson() => {
        "kg": kg,
        "lb": lb,
      };
}
