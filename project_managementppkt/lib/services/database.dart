import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference projectCollection = Firestore.instance.collection('project');

  Future updateUserData( String name, String section) async {
    return await projectCollection.document(uid).setData({
      'name' : name,
      'section': section,

    });
  }


  //get project stream
  Stream<QuerySnapshot> get projects {
    return projectCollection.snapshots();
  }
}