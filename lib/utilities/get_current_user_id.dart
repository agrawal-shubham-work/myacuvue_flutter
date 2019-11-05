import 'package:firebase_auth/firebase_auth.dart';

Future<String> inputData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return user.uid;
}
