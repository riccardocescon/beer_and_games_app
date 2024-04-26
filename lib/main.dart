import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/homepage.dart';
import 'package:beer_and_games/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

MaterialTheme _theme = const MaterialTheme(TextTheme());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // FirebaseFirestore.setLoggingEnabled(true);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  await initializeDateFormatting('it_IT', null);
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beer & Games',
      themeMode: ThemeMode.dark,
      darkTheme: _theme.dark().copyWith(
            popupMenuTheme: PopupMenuThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
            ),
          ),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<HomepageBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<UserBloc>(),
          ),
        ],
        child: const Homepage(),
      ),
    );
  }
}
