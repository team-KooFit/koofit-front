// // 2023.06.19 MON Midas: ❌
// // 코드 효율성 점검: ❌
// // 예외처리: ❌
// // 중복 서버 송수신 방지: ❌
//
// import 'dart:convert';
// import 'package:koofit/model/data/user.dart';
// import 'package:koofit/model/data/fitness.dart';
// import 'package:koofit/model/data/diet.dart';
// import 'package:hive/hive.dart';
//
// class Response {
//   static final List<Fitness> _fitness = [];
//   static final List<Diet> _diet = [];
//
//   // user
//   // ✅
//   static Future<void> createUser({required User newUser}) async {
//
//     //
//     final docRef = db.collection("users").doc(newUser.uid);
//     try {
//       await docRef.set(newUser.toJson());
//     } catch (e) {
//       print("[createUser] Error getting document: $e");
//     }
//   }
//
//   // ✅
//   static Future<User?> readUser({required String userUid}) async {
//     User? user;
//     final docRef = db.collection("users").doc(userUid);
//     try {
//       await docRef.get().then((DocumentSnapshot doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         user = User.fromJson(data);
//       });
//     } catch (e) {
//       print("[readUser] Error getting document: $e");
//     }
//
//     return user;
//   }
//
//   // ✅
//   static Future<void> updateUser({required User newUser}) async {
//     final docRef = db.collection("users").doc(newUser.uid);
//     try {
//       await docRef.update(newUser.toJson());
//     } catch (e) {
//       print("[updateUser] Error getting document: $e");
//     }
//   }
//
//   // ✅
//   static Future<void> deleteUser({required String userUid}) async {
//     final docRef = db.collection("users").doc(userUid);
//     try {
//       await docRef.delete();
//     } catch (e) {
//       print("[deleteUser] Error getting document: $e");
//     }
//   }
//
//   }
