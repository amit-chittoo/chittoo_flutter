import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class learnDailyModel {
  late String? _Title;
  late String? _Subtitle;
  late String? _point1;
  late String? _point2;
  late int? _downvotes;
  late int? _upvotes;

  late String? _point3;
  late String? _point4;
  late String? _point5;
  late String? _uploadDate;
  late String? _notificationSubtitle;
  late String? _notificationTitle;
  late String? _shareText;

  String? get Title => _Title;

  set Title(String? value) {
    _Title = value;
  }

  String? get point1 => _point1;

  set point1(String? value) {
    _point1 = value;
  }

  String? get point2 => _point2;

  set point2(String? value) {
    _point2 = value;
  }

  String? get point3 => _point3;

  set point3(String? value)
  {
    _point3 = value;
  }

  String? get point4 => _point4;

  set point4(String? value) {
    _point4 = value;
  }

  String? get point5 => _point5;

  set point5(String? value) {
    _point5 = value;
  }

  String? get uploadDate => _uploadDate;

  set uploadDate(String? value) {
    _uploadDate = value;
  }

  String? get shareText => _shareText;

  set shareText(String? value) {
    _shareText = value;
  }

  String? get Subtitle => _Subtitle;

  set Subtitle(String? value) {
    _Subtitle = value;
  }

  int? get downvotes => _downvotes;

  set downvotes(int? value) {
    _downvotes = value;
  }

  int? get upvotes => _upvotes;

  set upvotes(int? value) {
    _upvotes = value;
  }

  String? get notificationSubtitle => _notificationSubtitle;

  set notificationSubtitle(String? value) {
    _notificationSubtitle = value;
  }

  String? get notificationTitle => _notificationTitle;

  set notificationTitle(String? value) {
    _notificationTitle = value;
  }

  learnDailyModel(
      {required String Title,
      required String Subtitle,
      required String point1,
      required String point2,
      required String point3,
      required String point4,
      required String point5,
      required String uploadDate,
      required int upvotes,
      required int downvotes,
      required String notificationSubtitle,
      required String notificationTitle,
      required String shareText})
      : _Title = Title,
        _Subtitle = Subtitle,
        _point1 = point1,
        _point2 = point2,
        _point3 = point3,
        _point4 = point4,
        _point5 = point5,
        _upvotes = upvotes,
        _downvotes = downvotes,
        _uploadDate = uploadDate,
        _notificationSubtitle = notificationSubtitle,
        _notificationTitle = notificationTitle,
        _shareText = shareText;

  factory learnDailyModel.fromMap(Map<dynamic, dynamic> map) {
    print("hi there");
    print(map['notificationTitle']);
    return learnDailyModel(
      notificationTitle: map['notificationTitle'] ?? '',
      upvotes: map['upvotes'] ?? 0,
      notificationSubtitle: map['notificationSubtitle'] ?? '',
      downvotes: map['downvotes'] ?? 0,
      Title: map['Title'] ?? '',
      Subtitle: map['Subtitle'] ?? '',
      point1: map['point1'] ?? '',
      point2: map['point2'] ?? '',
      point3: map['point3'] ?? '',
      point4: map['point4'] ?? '',
      point5: map['point5'] ?? '',
      uploadDate: map['uploadDate'] ?? '',
      shareText: map['shareText'] ?? '',
    );
  }
}

List<learnDailyModel> getlearndata() {
  List<learnDailyModel> learmodel = [];

  FirebaseDatabase.instanceFor(app: Firebase.app("app2"))
      .ref("Learndaily")
      .child("20240118")
      .once()
      .then((snapshot)
  {
    if (snapshot.snapshot.value != null) {
      print(snapshot.snapshot.value);

      Map<dynamic, dynamic>? values =
          snapshot.snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {

        values.forEach((key, value) {
          print(value.runtimeType);
          print('$value');
          print('$key');
          try
          {
            learnDailyModel learnmodels = learnDailyModel.fromMap(value);
          }
          catch(error){
            print(error);
          }
          // learnDailyModel learnmodels = learnDailyModel.fromMap(value);
          // learmodel.add(learnmodels);
        });
      }
      else
        {
          print("null");
        }
    }
  }).catchError((error) {
    print('Error fetching data in learndaily: $error');
  });
  return learmodel;
}
