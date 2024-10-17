import 'dart:convert';

import 'package:intl/intl.dart';

class TargetEntity {
  int id;
  DateTime createTime;
  String title;
  String content;
  int colorType;
  List<TimeEntity> list;

  TargetEntity({
    required this.id,
    required this.createTime,
    required this.title,
    required this.content,
    required this.colorType,
    required this.list,
  });

  factory TargetEntity.fromJson(Map<String, dynamic> json) {
    return TargetEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
      content: json['content'],
      colorType: json['colorType'],
      list: (jsonDecode(json['list']) as List).map((e) => TimeEntity.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'title': title,
      'content': content,
      'colorType': colorType,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }
}

class TimeEntity {
  DateTime tapTime;

  TimeEntity({
    required this.tapTime,
  });

  factory TimeEntity.fromJson(Map<String, dynamic> json) {
    return TimeEntity(
      tapTime: DateTime.parse(json['tapTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tapTime': tapTime.toIso8601String(),
    };
  }

  String get tapTimeStr {
    return DateFormat('yyyy-MM-dd HH:mm').format(tapTime);
  }
}