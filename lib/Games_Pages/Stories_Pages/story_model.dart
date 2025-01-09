
import 'package:chittoo/Games_Pages/Stories_Pages/commentmodel.dart';
import 'package:firebase_database/firebase_database.dart';

class stories_model {
  late int? _commentno;
  late int? _reelshareno;
  late int? _followersno;
  late String? _url;
  late String? _key;
  late String? _section;

  String? get section => _section;

  set section(String? value) {
    _section = value;
  }

  late String? _youtubelink;
  late String? _videoId;
  late String? _timestamp;
  late String? _date;
  late String? _name;
  late String? _icon;
  int? _time;

  String? get youtubelink => _youtubelink;

  set youtubelink(String? value) {
    _youtubelink = value;
  }

  late List<Comment_Model>? _comments;
  late MediaType? _mediaType;
  late int? _duration;

  late int? _likeno;

  late int? _currentwatchingno;
  late String? _type;
  late bool? _released;
  late String? _link;

  List<Comment_Model>? get comments => _comments;

  set comments(List<Comment_Model>? value) {
    _comments = value;
  }

  String? get key => _key;

  set key(String? value) {
    _key = value;
  }

  String? get url {
    return _url;
  }

  set url(String? value) {
    _url = value;
  }

  String? get link => _link;

  set link(String? value) {
    _link = value;
  }

  MediaType? get mediaType => _mediaType;

  set mediaType(MediaType? value) {
    _mediaType = value;
  }

  int? get duration => _duration;

  set duration(int? value) {
    _duration = value;
  }

  int? get commentno => _commentno;

  set commentno(int? value) {
    _commentno = value;
  }

  int? get reelshareno => _reelshareno;

  set reelshareno(int? value) {
    _reelshareno = value;
  }

  int? get likeno => _likeno;

  set likeno(int? value) {
    _likeno = value;
  }

  int? get followersno => _followersno;

  set followersno(int? value) {
    _followersno = value;
  }

  int? get currentwatchingno => _currentwatchingno;

  set currentwatchingno(int? value) {
    _currentwatchingno = value;
  }

  String? get type => _type;

  set type(String? value) {
    _type = value;
  }

  bool? get released => _released;

  set released(bool? value) {
    _released = value;
  }

  stories_model(
      {required int commentno,
      required List<Comment_Model> comment,
      required String youtubelink,
      required String url,
      required String key,
      required int duration,
      required int reelshareno,
      required int likeno,
      required int followersno,
      required int currentwatchingno,
      required String type,
      required bool released,
      required String link,
      required String videoId,
      required String timestamp,
      required String name,
      required String icon,
      required String date,
      required String section,
      required int time})
      : _commentno = commentno,
        _url = url,
        _key = key,
        _duration = duration,
        _reelshareno = reelshareno,
        _likeno = likeno,
        _followersno = followersno,
        _currentwatchingno = currentwatchingno,
        _type = type,
        _released = released,
        _youtubelink = youtubelink,
        _videoId = videoId,
        _timestamp = timestamp,
        _date = date,
        _name = name,
        _link = link,
        _icon = icon,
        _time = time,
        _section = section,
        _comments = comment;

  factory stories_model.fromMap(Map<dynamic, dynamic> map) {
    // print("hi there");
    // print(map['type']);

    return stories_model(
      section: map['section']??'',
      commentno: map['commentno'] ?? 0,
      url: map['url'] ?? '',
      key: map['key'] ?? '',
      duration: map['duration'] ?? 0,
      reelshareno: map['reelshareno'] ?? 0,
      likeno: map['likeno'] ?? 0,
      followersno: map['followersno'] ?? 0,
      currentwatchingno: map['currentwatchingno'] ?? 0,
      type: map['type'] ?? '',
      released: map['released'] ?? false,
      youtubelink: map['youtube'] ?? '',
      link: map['link'] ?? '',
      videoId: map['videoId'] ?? '',
      timestamp: map['timestamp'] ?? '',
      date: map['data'] ?? '',
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
      time: map['time'] ?? 0,
      comment: map['comment'] ?? [],
    );
  }

  String? get videoId => _videoId;

  set videoId(String? value) {
    _videoId = value;
  }

  String? get timestamp => _timestamp;

  set timestamp(String? value) {
    _timestamp = value;
  }

  String? get date => _date;

  set date(String? value) {
    _date = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get icon => _icon;

  set icon(String? value) {
    _icon = value;
  }

  int? get time => _time;

  set time(int? value) {
    _time = value;
  }
}

List<stories_model> getStories() {
  List<stories_model> storyModel = [];

  FirebaseDatabase.instance
      .ref("storiesnewlatest")
      .orderByChild("released")
      .equalTo(false)
      .once()
      .then((snapshot) {
    // print("hi there" + snapshot.snapshot.value.toString());

    if (snapshot.snapshot.value != null) {

      Map<dynamic, dynamic>? values =
          snapshot.snapshot.value as Map<dynamic, dynamic>?;
      // print("hi there" + snapshot.snapshot.value.toString());
      if (values != null) {
        // Loop through the snapshot's children
        values.forEach((key, value) {
          // print(key);
          // print(value);
          stories_model storeiesdata = stories_model.fromMap(value);

          // Assuming "stories_model" class exists, create instances and add them to the list
          storyModel.add(storeiesdata);
        });
      }
      // setStories();
      print("stories length"+ '${storyModel.length}');
    }
  }).catchError((error) {
    print('Error fetching data:here $error');
  });
  return storyModel;
}

// for (DataSnapshot storychild in snapshot.children) {
//   if (storychild.value != null) {
//     Map<dynamic, dynamic>? storyData = storychild.value as Map<dynamic, dynamic>?;
//
//     if (storyData != null && storyData['comment'] != null) {
//       print("hi ether"+storyData['comment']);
//     }
//   }
// }
// Map<dynamic, dynamic>? values = storychild.value as Map?;
// if (values != null) {
//   print("hi there.. not null");
//   values.forEach((key, value) {
//     stories_model storyModel = stories_model.fromMap(value);
//     storymodel.add(storyModel);
//
//     print("hi there..." + storymodel.length.toString());
//   });
// }

// if(snapshot.value!=null)
//     print("hi there.." + snapshot.value.toString());
enum MediaType {
  image,
  video,
}
