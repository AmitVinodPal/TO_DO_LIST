import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Controllers/Contact_controllers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ContatctController contacts = Get.put(ContatctController());
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Center(
          child: Text(
            "CRUD",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: contacts.title,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.indigo[300],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: contacts.number,
                      decoration: InputDecoration(
                          hintText: "Number",
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.indigo[300],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          contacts.addcontact();
                        },
                        child: Text("Submit")),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          contacts.getcontact();
                        },
                        child: Text("Call")),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    //color: Colors.blueAccent,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(
                      () => ListView(
                          children: contacts.contactList
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Colors.black54,
                                      textColor: Colors.tealAccent,
                                      title: Text(e.name.toString()),
                                      leading: Icon(
                                        Icons.favorite_outlined,
                                        color: Colors.red,
                                      ),
                                      subtitle: Text(
                                        e.number.toString(),
                                        style: TextStyle(
                                            color: Colors.purpleAccent[200]),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Delete Contact"),
                                                content: Text(
                                                    "Are you sure you want to delete this contact?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      contacts.delete(e.id);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Delete"),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.lightGreenAccent,
                                        ),
                                      ),
                                      // IconButton(
                                      //     onPressed: () {
                                      //       contacts.delete(contacts.database
                                      //           .collection("Contact")
                                      //           .doc()
                                      //           .id);
                                      //     },
                                      //     icon: Icon(Icons.delete)
                                      // ),
                                    ),
                                  ))
                              .toList()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
