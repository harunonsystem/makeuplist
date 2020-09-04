class User {
  final String name;
  final String uid;
  final String email;
  final String imgUrl;

  User({this.uid, this.email, this.imgUrl, this.name});

  // toJson() {
  //   return {'name': name, 'uid': uid, 'email': email, 'imgUrl': imgUrl};
  // }
}
