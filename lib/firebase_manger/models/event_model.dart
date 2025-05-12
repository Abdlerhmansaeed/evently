class EventModel {
  String? id;
  String? userid;
  String categoryId;
  bool isFav;
  String image;
  String title;
  String description;
  String eventDate;
  String eventTime;
  EventModel(
      {this.id,
      this.userid,
      this.isFav = false,
      required this.categoryId,
      required this.description,
      required this.title,
      required this.image,
      required this.eventDate,
      required this.eventTime});

  EventModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            isFav: json['isFav'] ?? false,
            userid: json['userid'],
            description: json['description'],
            categoryId: json['categoryId'],
            title: json['title'],
            eventDate: json['eventDate'],
            eventTime: json['eventTime'],
            image: json['image']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userid': userid,
      'categoryId': categoryId,
      'image': image,
      'title': title,
      'description': description,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'isFav': isFav
    };
  }
}
