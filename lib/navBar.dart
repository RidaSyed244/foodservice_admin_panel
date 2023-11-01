import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_basics/ApprovedDrivers.dart';
import 'package:the_basics/allDrivers.dart';
import 'package:the_basics/approved_Restraunts.dart';
import 'package:the_basics/users.dart';
import 'DisapprovedDrivers.dart';
import 'dashboard.dart';
import 'disapprovedRestraunts.dart';
import 'logIn.dart';

class NavBar extends ConsumerStatefulWidget {
  const NavBar({super.key});

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Admin Panel",
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                accountEmail: Text(
                  "",
                  style: TextStyle(
                      fontSize: 0.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                // currentAccountPicture: CircleAvatar(
                //   radius: 23,
                //   backgroundColor: Colors.black,
                //   child: NetworkImage(data.image.toString()) == true
                //       ? Container(
                //           decoration: BoxDecoration(
                //               color: Colors.black,
                //               borderRadius: BorderRadius.circular(55)),
                //           width: 100,
                //           height: 100,
                //         )
                //       : CircleAvatar(
                //           radius: 55,
                //           backgroundImage: NetworkImage(data.image.toString()),
                //         ),
                // ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.restaurant_outlined,
                  color: Colors.white,
                ),
                title: Text("All Restraunts",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                title: Text("All Approved Restraunts",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApprovedRestraunts())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                title: Text("All disapproved restraunts",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisApprovedRestraunts())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                title: Text("Approved Drivers",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApprovedDrivers())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                title: Text("Disapproved Drivers",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisapprovedDrivers())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.drive_eta_rounded,
                  color: Colors.white,
                ),
                title: Text("All Drivers",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllDrivers())),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text("Log_Out",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () async {
                    ref
                        .read(logIn.notifier)
                        .signout()
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIn()),
                            ));
                  }),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ],
          )),
    );
  }
}
