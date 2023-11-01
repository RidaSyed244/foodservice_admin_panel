import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/DrivingLicenseImage.dart';
import 'package:the_basics/IDCard-Image.dart';
import 'package:the_basics/users.dart';

import 'StateManagement.dart';

class AllDrivers extends ConsumerStatefulWidget {
  const AllDrivers({super.key});

  @override
  ConsumerState<AllDrivers> createState() => _AllDriversState();
}

class _AllDriversState extends ConsumerState<AllDrivers> {
  @override
  Widget build(BuildContext context) {
    final allDrivers = ref.watch(driverProvider);
    print(FirebaseAuth.instance.currentUser?.uid);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('All Drivers',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
        ),
        body: allDrivers.when(
          data: (data) {
            if (data.docs.isEmpty) {
              return const Center(
                child: Text('No Driver yet'),
              );
            } else {
              return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    AllDriverss driverModel =
                        AllDriverss.fromMap(data.docs[index].data());
                    DocumentSnapshot driver = data.docs[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),

                          // padding:  EdgeInsets.fromLTRB(70, 35, 70, 0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8, 10, 8, 3),

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // CircleAvatar(
                                    //   radius: 23,
                                    //   backgroundColor: Colors.grey,
                                    //   child: NetworkImage(driverModel
                                    //               .restraunt_logo
                                    //               .toString()) ==
                                    //           true
                                    //       ? Container(
                                    //           decoration: BoxDecoration(
                                    //               color: Colors.grey[200],
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       50)),
                                    //           width: 100,
                                    //           height: 100,
                                    //         )
                                    //       : CircleAvatar(
                                    //           radius: 55,
                                    //           backgroundImage: NetworkImage(
                                    //               adminModel.restraunt_logo
                                    //                   .toString()),
                                    //         ),
                                    // ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 8, 0, 0),
                                      child: Text(
                                        "Name: ${driverModel.Driver_name.toString()}",
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
                                        "Email: ${driverModel.Driver_email.toString()}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "Phone-No.: ${driverModel.Driver_Phone.toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        "CNIC: ${driverModel.CNIC_No.toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Row(
                                        children: [
                                          Text(
                                            "ID-Card Image: ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                print(
                                                  driverModel.IDCardImageUrl
                                                      .toString(),
                                                );
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            IDCardImage(
                                                              idCardImage: driverModel
                                                                      .IDCardImageUrl
                                                                  ,
                                                            )));
                                              },
                                              child: Text(
                                                "View Image",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Driving License: ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DrivingLicenseImage(
                                                              drivingLicenseImages:
                                                                  driverModel
                                                                      .DrivingLicenseImageUrl,
                                                            )));
                                              },
                                              child: Text(
                                                "View Image",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ))
                                        ],
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        "Status: ${driverModel.driverStatus.toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 167, 52, 1),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Material(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)),
                                            child: MaterialButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .collection('All_Drivers')
                                                    .doc(driver.id)
                                                    .update({
                                                  'driverStatus': 'Approved',
                                                });

                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             ApprovedRestraunts()));
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
                                                await FirebaseFirestore.instance
                                                    .collection('All_Drivers')
                                                    .doc(driver.id)
                                                    .update({
                                                  'driverStatus': 'Disapproved',
                                                });

                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             DisApprovedRestraunts()));
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
