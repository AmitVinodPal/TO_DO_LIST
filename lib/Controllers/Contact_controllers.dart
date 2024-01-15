import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist/Controllers/model.dart';


class ContatctController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController number = TextEditingController();
  RxList<Contact> contactList = RxList<Contact>([]);
  // late CollectionReference collectionReference;
  final database = FirebaseFirestore.instance;

  void inInt() {
    super.onInit();
    getcontact();
  }

  void delete(var ContactId) async {
    print(ContactId);
    await database
        .collection("Contact")
        .doc(ContactId)
        .delete()
        .whenComplete(() => printInfo(info: "Contact delete"));
    getcontact();
    // collectionReference
    //     .doc(ContactId)
    //     .delete()
    //     .whenComplete(() => printInfo(info: "Contact deleted"));
  }

  void addcontact() async {
    var connect = Contact(id: '', name: title.text, number: number.text);
    await database
        .collection("Contact")
        .add(connect.toJson())
        .then((DocumentReference docid) => {
              database
                  .collection("Contact")
                  .doc(docid.id)
                  .update({"id": docid.id})
            })
        .whenComplete(() {
      () => printInfo(info: "Contact aagaya");

      getcontact();
    }); //contact (1 bracet wala)is path of database firestore
  }

  void getcontact() async {
    await database.collection("Contact").get().then((value) {
      contactList.value =
          value.docs.map((e) => Contact.fromJson(e.data())).toList();
    });
    print("get");
  }
}
