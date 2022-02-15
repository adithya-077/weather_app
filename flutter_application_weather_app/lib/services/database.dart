import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final uid;
  DatabaseService({
    required this.uid,
  });
  final CollectionReference userDataColoection =
      FirebaseFirestore.instance.collection('UserData');

  Future updateUserData(
      {required String dname,
      required String dpic,
      required String dcity}) async {
    return await userDataColoection.doc(uid).set({
      'displayName': dname,
      'displayPicture': dpic,
      'displaycity': dcity,
    });
  }
}
