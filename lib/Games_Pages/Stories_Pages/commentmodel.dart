class Comment_Model {
  String? _user;
  String? _comment;
  String? _image;

  String? get user => _user;

  set user(String? value) {
    _user = value;
  }

  String? get comment => _comment;

  String? get image => _image;

  set image(String? value) {
    _image = value;
  }

  set comment(String? value) {
    _comment = value;
  }

}
