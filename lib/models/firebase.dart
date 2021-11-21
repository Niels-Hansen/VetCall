import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vetcall/services/auth_service.dart';

Future<void> userSetup(
    String firstName, String lastName, String email, String password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid;
  AuthService()
      .createUserWithEmailAndPassword(email, password)
      .whenComplete(() => {
            uid = auth.currentUser?.uid,
            users.add({
              'uid': uid,
              'firstname': firstName,
              'lastname': lastName,
              'email': email
            })
          });
  return;
}

Future<void> vetSetup(
    String firstName,
    String lastName,
    String companyName,
    String cvr,
    String address,
    String country,
    String regNo,
    String accountNumber,
    String hourlyFee,
    String email,
    String password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid;
  AuthService()
      .createUserWithEmailAndPassword(email, password)
      .whenComplete(() => {
            uid = auth.currentUser?.uid,
            users.add({
              'uid': uid,
              'firstname': firstName,
              'lastname': lastName,
              'companyname': companyName,
              'cvr': cvr,
              'address': address,
              'country': country,
              'regNo': regNo,
              'accountnumber': accountNumber,
              'hourlyfee': hourlyFee,
              'email': email
            })
          });
  return;
}
