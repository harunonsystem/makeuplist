// import 'package:firebase_database/firebase_database.dart';

// class List{
//   String key;
//   String title;
//   String imgUrl;
//   bool completed;

//   List(this.key, this.title, this.imgUrl, this.completed);

//   List.fromSnapshot(DataSnapshot snapshot) :
//     key = snapshot.key,
//     title = snapshot.value['title'],
//     imgUrl = snapshot.value['imgUrl'],
//     completed = snapshot.value['completed'];

//   toJson() {
//     return{
//       'title' : title,
//       'imgUrl' : imgUrl,
//       'completed': completed,
//     };
//   }

// }

class List {
  final String title;
  final String imgUrl;
  bool completed;

  List({this.completed, this.imgUrl, this.title});

  factory List.fromMap(Map data) {
    data = data ?? {};
    return List(
        title: data['title'] ?? '',
        imgUrl: data['imgUrl'] ?? '',
        completed: false);
  }
}