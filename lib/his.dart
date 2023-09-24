class His {
  String? className;
  String? path;
  int? userId;
  int? id;
  String? title;
  String? body;

  His({
    this.className,
    this.path,
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory His.fromJson(Map<String, dynamic> json) => His(
        className: json["__className"] as String?,
        path: json["__path"] as String?,
        userId: json["userId"] as int?,
        id: json["id"] as int?,
        title: json["title"] as String?,
        body: json["body"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "__className": className,
        "__path": path,
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

final h = [
  {"time": "01:00", "img": "images/clud_icon_bar.png", "degr": "20 °"},
  {"time": "Now", "img": "images/clud2.png", "degr": "19 °"},
  {"time": "03:00", "img": "images/clud_raining_icon.png", "degr": "21 °"},
  {"time": "04:00", "img": "images/sun1_icon_bar.png", "degr": "15 °"},
  {"time": "05:00", "img": "images/cludy.png", "degr": "25 °"},
  {"time": "05:00", "img": "images/clud_icon_bar.png", "degr": "22 °"},
];
