import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'StateManagement.dart';

final allRestrauntData =
    FirebaseFirestore.instance.collection('All_Restraunts');
final streamProvider = StreamProvider((ref) => allRestrauntData.snapshots());
final logIn = StateNotifierProvider((ref) => LoGIn());
final allDriversData = FirebaseFirestore.instance.collection('All_Drivers');
final driverProvider = StreamProvider((ref) => allDriversData.snapshots());
