
class BookingModels {
  late final String id ;
  late final String date ;
  late final String time ;
  late final String availability ;

  BookingModels({
    required this.id,
    required  this.date,
    required this.time,
    required this.availability
  });

  factory BookingModels.fromJson(Map<String, dynamic> json)
  {
    return BookingModels(
      id: json['id'] as String,
      date: json['time'] ,
      time: json['title'] ,
      availability: json['body'] as String,
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['time'] = time;
//   data['title'] = title;
//   data['body'] = body;
//   return data;
// }
}

class BookingModel {
  String? id;
  String? date;
  String? time;
  String? availability;

  BookingModel({this.id, this.date, this.time, this.availability});

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    date = json['date'];
    time = json['time'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['time'] = time;
    data['availability'] = availability;
    return data;
  }
}

class LoginModel {
  String? id;
  String? name;
  String? age;

  LoginModel({this.id, this.name, this.age});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['date'] = name;
    data['time'] = age;
    return data;
  }
}



