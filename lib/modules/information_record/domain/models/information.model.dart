// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Information {
  String value;
  DateTime? registrationDate;

  Information({
    required this.value,
    this.registrationDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'registrationDate': registrationDate?.millisecondsSinceEpoch,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    final registrationDateTEXT = map['registrationDate'];
    DateTime? registrationDate;
    if (registrationDateTEXT != null) {
      registrationDate = DateTime.fromMillisecondsSinceEpoch(registrationDateTEXT as int);
    }
    return Information(
      value: map['value'] as String,
      registrationDate: registrationDate,
    );
  }

  String toJson() => json.encode(toMap());

  factory Information.fromJson(String source) => Information.fromMap(json.decode(source) as Map<String, dynamic>);

  Information copyWith({
    String? value,
    DateTime? registrationDate,
  }) {
    return Information(
      value: value ?? this.value,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }
}
