class AvailableDateModel{
  DateTime? date;
  AvailableDateModel.fromJson(Map<String, dynamic> json){
    date = json['date'];
  }
}