import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetcall/Discover/Discover.dart';
import 'package:vetcall/loginpage.dart';

import 'package:vetcall/models/user_model.dart';
import 'package:vetcall/services/auth_service.dart';
import 'package:vetcall/test_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? Discover() : TestPage(); //Testpage home screen
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
