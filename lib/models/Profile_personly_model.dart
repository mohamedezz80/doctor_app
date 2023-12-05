

class ProfilePersonly {
  String? id ;
  String? time ;
  String? title ;
  String? body ;

  ProfilePersonly({
    this.id,
    this.time,
    this.title,
    this.body});

  ProfilePersonly.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    time = json['time'].toString();
    title = json['title'].toString();
    body = json['body'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}