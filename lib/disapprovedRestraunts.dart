// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/users.dart';

import 'StateManagement.dart';

class DisApprovedRestraunts extends ConsumerStatefulWidget {
  const DisApprovedRestraunts({super.key});

  @override
  ConsumerState<DisApprovedRestraunts> createState() =>
      _DisApprovedRestrauntsState();
}

class _DisApprovedRestrauntsState extends ConsumerState<DisApprovedRestraunts> {
  @override
  Widget build(BuildContext context) {
    final allDisAprovedRestraunts = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Dissaproved Restraunts',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: allDisAprovedRestraunts.when(
        data: (data) {
          if (data.docs.isEmpty) {
            return const Center(
              child: Text('No DisApproved Restraunt yet'),
            );
          } else {
            return ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  Admin adminModel = Admin.fromMap(data.docs[index].data());
                  DocumentSnapshot? restraunt = data.docs[index];

                  if (adminModel.status == "Disapproved") {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),

                          // padding: EdgeInsets.fromLTRB(70, 35, 70, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(3, 10, 3, 3),

                            // padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 23,
                                        backgroundColor: Colors.grey,
                                        child: NetworkImage(adminModel
                                                    .restraunt_logo) ==
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
                                                    adminModel.restraunt_logo),
                                              ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "${adminModel.restaurant_name}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
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
                                        "Address: ${adminModel.restaurant_address.toString()}",
                                        textAlign: TextAlign.left,
                                        maxLines: 7,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
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
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            height: 47,
                                            width: 120,
                                            child: Center(
                                              child: Text(
                                                "Disapproved",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text("");
                  }
                });
          }
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
