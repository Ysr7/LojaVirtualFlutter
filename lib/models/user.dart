import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.email, this.pass, this.name, this.confirmPass, this.id});

  User.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data["name"] as String;
    email = document.data["email"] as String;
  }

  String id;
  String name;
  String email;
  String pass;

  String confirmPass;

  DocumentReference get firestoreRef =>
      Firestore.instance.document("users/$id");

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }
}
