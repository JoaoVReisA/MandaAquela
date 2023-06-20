import 'package:manda_aquela/data/models/address_model.dart';

class Address {
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.neighborhood,
    required this.number,
  });

  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String neighborhood;
  final int number;

  AddressModel toModel() {
    return AddressModel(
      street: street,
      city: city,
      state: state,
      zipCode: zipCode,
      neighborhood: neighborhood,
      number: number,
    );
  }
}
