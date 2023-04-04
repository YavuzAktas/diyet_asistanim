import 'package:diyet_asistanim/product/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class Dietitian extends Equatable with IdModel, BaseFirebaseModel<Dietitian>{

  const Dietitian({
    this.age,
    this.cv,
    this.experience,
    this.image,
    this.name,
    this.services,
    this.servicesID,
    this.specialist,
    this.specialistID,
    this.surname,
    this.id,
  });
  final String? age;
  final String? cv;
  final String? experience;
  final String? image;
  final String? name;
  final String? services;
  final String? servicesID;
  final String? specialist;
  final String? specialistID;
  final String? surname;
  @override
  final String? id;

  @override
  List<Object?> get props => [
    age,
    cv,
    experience,
    image,
    name,
    services,
    servicesID,
    specialist,
    specialistID,
    surname,
    id
  ];

  Dietitian copyWith({
    String? age,
    String? cv,
    String? experience,
    String? image,
    String? name,
    String? services,
    String? servicesID,
    String? specialist,
    String? specialistID,
    String? surname,
    String? id,
  }) {
    return Dietitian(
      age: age ?? this.age,
      cv: cv ?? this.cv,
      experience: experience ?? this.experience,
      image: image ?? this.image,
      name: name ?? this.name,
      services: services ?? this.services,
      servicesID: servicesID ?? this.servicesID,
      specialist: specialist ?? this.specialist,
      specialistID: specialistID ?? this.specialistID,
      surname: surname ?? this.surname,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'cv': cv,
      'experience': experience,
      'image': image,
      'name': name,
      'services': services,
      'servicesID': servicesID,
      'specialist': specialist,
      'specialistID': specialistID,
      'surname': surname,
      'id': id,
    };
  }

  @override
  Dietitian fromJson(Map<String, dynamic> json) {
    return Dietitian(
      age: json['age'] as String?,
      cv: json['cv'] as String?,
      experience: json['experience'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      services: json['services'] as String?,
      servicesID: json['servicesID'] as String?,
      specialist: json['specialist'] as String?,
      specialistID: json['specialistID'] as String?,
      surname: json['surname'] as String?,
      id: json['id'] as String?,
    );
  }
}
