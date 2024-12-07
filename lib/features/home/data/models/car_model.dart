import 'dart:convert';

class CarModel {
  final String carBrand;
  final String carModel;
  final String condition;
  final String contractInfo;
  final String description;
  final int doorsNumber;
  final String gearBox;
  final String location;
  final String mileage;
  final String phoneNumber;
  final List<String> photos;
  final String petrolKind;
  final int price;
  final String publisherId;
  final int seatNumber;
  final int tankSize;
  final String year;
  CarModel({
    required this.carBrand,
    required this.carModel,
    required this.condition,
    required this.contractInfo,
    required this.description,
    required this.doorsNumber,
    required this.gearBox,
    required this.location,
    required this.mileage,
    required this.phoneNumber,
    required this.photos,
    required this.price,
    required this.publisherId,
    required this.seatNumber,
    required this.tankSize,
    required this.petrolKind,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'car_brand': carBrand,
      'car_model': carModel,
      'condition': condition,
      'contract_info': contractInfo,
      'description': description,
      'doors_number': doorsNumber,
      'gear_box': gearBox,
      'location': location,
      'mileage': mileage,
      'phone_number': phoneNumber,
      'photos': photos,
      'price': price,
      'publisher_id': publisherId,
      'seat_number': seatNumber,
      'tank_size': tankSize,
      'year': year,
      'petrol_kind': petrolKind
    };
  }

  factory CarModel.fromJson(Map<String, dynamic> map) {
    return CarModel(
        carBrand: map['car_brand'] as String,
        carModel: map['car_model'] as String,
        condition: map['condition'] as String,
        contractInfo: map['contract_info'] as String,
        description: map['description'] as String,
        doorsNumber: map['doors_number'] as int,
        gearBox: map['gear_box'] as String,
        location: map['location'] as String,
        mileage: map['mileage'] as String,
        phoneNumber: map['phone_number'] as String,
        photos: List<String>.from((map['photos'] as List)),
        price: map['price'] as int,
        publisherId: map['publisher_id'] as String,
        seatNumber: map['seat_number'] as int,
        tankSize: map['tank_size'] as int,
        year: map['year'] as String,
        petrolKind: map['petrol_kind'] as String);
  }
}
