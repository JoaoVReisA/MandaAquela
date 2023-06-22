import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';

class EventMusician {
  String id;
  String name;
  String locale;
  String date;
  String description;
  int capacity;
  String categoryId;
  List<OpportunityModel> oportunities;

  EventMusician({
    required this.id,
    required this.name,
    required this.locale,
    required this.date,
    required this.description,
    required this.capacity,
    required this.categoryId,
    required this.oportunities,
  });

  factory EventMusician.fromJson(Map<String, dynamic> json) => EventMusician(
        id: json["id"],
        name: json["name"],
        locale: json["locale"],
        date: json["date"],
        description: json["description"],
        capacity: json["capacity"],
        oportunities: List<OpportunityModel>.from(
          (json['oportunities'] as List<dynamic>).map<OpportunityModel>(
            (x) => OpportunityModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locale": locale,
        "date": date,
        "description": description,
        "capacity": capacity,
        "categoryId": categoryId,
        "oportunities": List<dynamic>.from(oportunities.map((x) => x.toJson())),
      };

  Events toEntity() {
    return Events(
      id: id,
      name: name,
      description: description,
      locale: locale,
      capacity: capacity,
      oportunities: oportunities.map((x) => x.toEntity()).toList(),
      date: date,
    );
  }
}
