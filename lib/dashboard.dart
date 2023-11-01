import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/approved_Restraunts.dart';
import 'package:the_basics/disapprovedRestraunts.dart';
import 'package:the_basics/users.dart';
import 'StateManagement.dart';
import 'navBar.dart';
  var adminEmail;

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    getCurrentUser();
    getAdminEmail();
    super.initState();
  }

  var loggedInUser;
  getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser?.email;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    } else {
      print("No user found");
    }
  }

   getAdminEmail() async {
    await FirebaseFirestore.instance
        .collection('Admin')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        adminEmail = value.data()?['AdminEmail'];
        print(adminEmail);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final allRestraunts = ref.watch(streamProvider);
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            'All Restraunts',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: allRestraunts.when(
          data: (data) {
            if (data.docs.isEmpty) {
              return const Center(
                child: Text('No Restraunt yet'),
              );
            } else {
              return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    Admin adminModel = Admin.fromMap(data.docs[index].data());
                    DocumentSnapshot restraunt = data.docs[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),

                          // padding:  EdgeInsets.fromLTRB(70, 35, 70, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 3),

                            // padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            // height: 304,

                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.grey,
                                      child: NetworkImage(adminModel
                                                  .restraunt_logo
                                                  .toString()) ==
                                              true
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              width: 100,
                                              height: 100,
                                            )
                                          : CircleAvatar(
                                              radius: 55,
                                              backgroundImage: NetworkImage(
                                                  adminModel.restraunt_logo
                                                      .toString()),
                                            ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "${adminModel.restaurant_name}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email: ${adminModel.email}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "Address: ${adminModel.restaurant_address}",
                                        textAlign: TextAlign.left,
                                        maxLines: 7,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        "Curency: ${adminModel.restraunt_currency.toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        "Status: ${adminModel.status.toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 167, 52, 1),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // SizedBox(height: 60),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Material(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6.0)),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'All_Restraunts')
                                                        .doc(restraunt.id)
                                                        .update({
                                                      'status': 'Approved',
                                                    });

                                                    
                                                  },
                                                  minWidth: 100.0,
                                                  height: 36.0,
                                                  child: Text('Approve',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Material(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6.0)),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'All_Restraunts')
                                                        .doc(restraunt.id)
                                                        .update({
                                                      'status': 'Disapproved',
                                                    });

                                                    
                                                  },
                                                  minWidth: 100.0,
                                                  height: 36.0,
                                                  child: Text('Disapprove',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }
}
