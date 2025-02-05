import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase {
  static CollectionReference<EventModel> getRef() {
    return FirebaseFirestore.instance.collection("Events").withConverter(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.tojson(),
        );
  }

  static Future<void> addEvent(EventModel data) async {
    var ref = getRef();
    var docRef = ref.doc();
    data.id = docRef.id;
    data.userid = FirebaseAuth.instance.currentUser?.uid ?? "";
    return await docRef.set(data);
  }

  static Future<void> updateEvent(EventModel data) async {
   try{
     var ref = getRef();
     var doc = ref.doc(data.id);
     await doc.update(data.tojson());

   }catch(e){
     print(e.toString());
   }
  }

  static Future<void> setFav(EventModel data) async {
    var ref = getRef();
    var docRef = ref.doc(data.id);

    return await docRef.update({"isFav": !data.isFav});
  }

  static Stream<QuerySnapshot<EventModel>> getEvents([String? cateid]) {
    var ref = cateid == null || cateid == "ALL"
        ? getRef()
            .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        : getRef().where("categoryId", isEqualTo: cateid);
    var docs = ref.snapshots();
    return docs;
  }

  static Future<List<QueryDocumentSnapshot<EventModel>>> getFav() async {
    var ref = getRef()
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    var docs = await ref.where("isFav", isEqualTo: true).get();
    return docs.docs;
  }

  static Future<List<QueryDocumentSnapshot<EventModel>>> getEventDeatis(
      [String? eventId]) async {
    var ref = getRef()
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    var docs = await ref.where("id", isEqualTo: eventId).get();
    return docs.docs;
  }

  static Future<List<QueryDocumentSnapshot<EventModel>>> search(
      String q) async {
    var ref = getRef()
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    var docs = await ref
        .where("isFav", isEqualTo: true)
        .where("keywords", arrayContains: q.toLowerCase())
        .get();
    return docs.docs;
  }

  static Future<void> deleteEvent([String? event]) async {
    var ref = getRef();
    var docRef = ref.doc(event ?? "");

    return await docRef.delete();
  }
}
