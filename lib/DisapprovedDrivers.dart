import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/DrivingLicenseImage.dart';

import 'IDCard-Image.dart';
import 'StateManagement.dart';
import 'users.dart';

class DisapprovedDrivers extends ConsumerStatefulWidget {
  const DisapprovedDrivers({super.key});

  @override
  ConsumerState<DisapprovedDrivers> createState() => _DisapprovedDriversState();
}

class _DisapprovedDriversState extends ConsumerState<DisapprovedDrivers> {
  @override
  Widget build(BuildContext context) {
    final allDrivers = ref.watch(driverProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              textAlign: TextAlign.center,
              'Disapproved Drivers',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: allDrivers.when(
          data: (data) {
            if (data.docs.isEmpty) {
              return const Center(
                child: Text('No Disapproved Driver yet'),
              );
            } else {
              return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    AllDriverss driverModel =
                        AllDriverss.fromMap(data.docs[index].data());
                    if (driverModel.driverStatus == "Disapproved") {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 8, 0, 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          height: 10,
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
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              IDCardImage(
                                                                idCardImage: driverModel
                                                                        .IDCardImageUrl
                                                                    .toString(),
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
                                                                            .DrivingLicenseImageUrl
                                                                        .toString(),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  });
            }
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }
}
