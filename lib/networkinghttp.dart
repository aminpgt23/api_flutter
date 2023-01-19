import 'dart:convert';

import 'package:api/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

// Future<http.Response> getData() async {
//   var result =
//       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//   print(result.body);
//   return result;
// }

// Future<http.Response> postData() async {
//   Map<String, dynamic> data = {
//     "name": "jhoe doe",
//     "email": "postmethod@test.com"
//   };
//   var result = await http.post(
//       Uri.parse("https://jsonplaceholder.typicode.com/users"),
//       headers: <String, String>{
//         "Content-Type": "application/json; charshet=UTF-8"
//       });
//   print(result.statusCode);
//   return result;
// }

// Future<http.Response> updateData(int id) async {
//   Map<String, dynamic> data = {
//     "name": "jhoe doe",
//     "email": "postmethod@test.com"
//   };
//   var result = await http.put(
//       Uri.parse("https://jsonplaceholder.typicode.com/users/${id}"),
//       headers: <String, String>{
//         "Content-Type": "application/json; charshet=UTF-8"
//       });
//   print(result.body);
//   return result;
// }

// Future<http.Response> deleteData(int id) async {
//   Map<String, dynamic> data = {
//     "name": "jhoe doe",
//     "email": "postmethod@test.com"
//   };
//   var result = await http.delete(
//       Uri.parse("https://jsonplaceholder.typicode.com/users/${id}"),
//       headers: <String, String>{
//         "Content-Type": "application/json; charshet=UTF-8"
//       });
//   print(result.body);
//   return result;
// }

class NetworkingApps extends StatelessWidget {
  NetworkingApps({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: NetworkingHome());
  }
}

class NetworkingHome extends StatefulWidget {
  const NetworkingHome({super.key});

  @override
  State<NetworkingHome> createState() => _NetworkingHomeState();
}

class _NetworkingHomeState extends State<NetworkingHome> {
  final namaC = TextEditingController();
  final emailC = TextEditingController();
  final jenderC = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = getUser();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[600],
        title: Center(
          child: Text(
            "examp http",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    scrollable: true,
                    title: Text('Tambah'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: ' nama',
                                icon: Icon(Icons.people),
                              ),
                              controller: namaC,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'email',
                                icon: Icon(Icons.email),
                              ),
                              controller: emailC,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'sex',
                                icon: Icon(Icons.family_restroom),
                              ),
                              controller: jenderC,
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            insertUser(
                              {
                                "nama": namaC.text,
                                "email": emailC.text,
                                "jender": jenderC.text
                              },
                            );
                            setState(() {});
                            Navigator.pop(context);
                          })
                    ]);
              });
        },
        child: Icon(Icons.add),
      ),
      body:
          // Stack(
          //   children: <Widget>[
          //     ListView(
          //       children: <Widget>[
          //         StreamBuilder<QuerySnapshot>(
          //             // stream: users.snapshots(),
          //             builder: (context, snapshot) {
          //               if (snapshot.hasData) {
          //                 return Column(
          //                   children: snapshot.data!.docs
          //                   .map((e) => item(e['name'],e['age']))
          //                   .toList();
          //                 );
          //               }else{
          //                 return Text("loading");                      }
          //               // return ListView.builder(itemBuilder:(context, index) {
          //               //   return ListTile(title: ,)
          //               // });
          //             }),
          //       ],
          //     ),
          //   ],
          // )
          FutureBuilder<http.Response>(
              future: data,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  List<dynamic> json = jsonDecode(snapshot.data!.body);
                  return ListView.builder(
                      itemCount: json.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                    title:
                                        Text("nama : " + json[index]["nama"]),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("email : " + json[index]["email"]),
                                        Text("jenis kelamin : " +
                                            json[index]["jender"]),
                                        SizedBox(
                                          width: 40,
                                          height: 10,
                                        )
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              namaC.text = json[index]["nama"];
                                              emailC.text =
                                                  json[index]["email"];
                                              jenderC.text =
                                                  json[index]["jender"];
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                        scrollable: true,
                                                        title: Text('Tambah'),
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Form(
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        ' nama',
                                                                    icon: Icon(Icons
                                                                        .people),
                                                                  ),
                                                                  controller:
                                                                      namaC,
                                                                ),
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'email',
                                                                    icon: Icon(Icons
                                                                        .email),
                                                                  ),
                                                                  controller:
                                                                      emailC,
                                                                ),
                                                                TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'sex',
                                                                    icon: Icon(Icons
                                                                        .family_restroom),
                                                                  ),
                                                                  controller:
                                                                      jenderC,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        actions: [
                                                          ElevatedButton(
                                                              child: Icon(
                                                                  Icons.add),
                                                              onPressed:
                                                                  () async {
                                                                await updateUser(
                                                                  json[index]
                                                                      ["id"],
                                                                  {
                                                                    "nama": namaC
                                                                        .text,
                                                                    "email":
                                                                        emailC
                                                                            .text,
                                                                    "jender":
                                                                        jenderC
                                                                            .text
                                                                  },
                                                                );
                                                                setState(() {});
                                                                Navigator.pop(
                                                                    context);
                                                              })
                                                        ]);
                                                  });
                                              // updateUser(json[index]["id"]);
                                            },
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () async {
                                              await deleteUser(
                                                  json[index]["id"]);
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
