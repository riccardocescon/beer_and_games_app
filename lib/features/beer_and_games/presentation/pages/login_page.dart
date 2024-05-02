import 'dart:developer';

import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/homepage.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () async {
                _signInWithGoogle().then((user) {
                  if (user == null) {
                    log('User is null');
                  } else {
                    context.push(
                      BlocProvider(
                        create: (context) => sl<HomepageBloc>()
                          ..add(const HomepageEvent.setup()),
                        child: const Homepage(),
                      ),
                    );
                  }
                });
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      return user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
