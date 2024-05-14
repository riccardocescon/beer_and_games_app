import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/homepage.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/login_page.dart';
import 'package:beer_and_games/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final currentUser = FirebaseAuth.instance.currentUser;
    bool started = false;
    User? lastUser;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Beer & Games',
      themeMode: ThemeMode.dark,
      darkTheme: _theme.dark().copyWith(
            popupMenuTheme: PopupMenuThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<UserBloc>(),
          ),
          BlocProvider(
            create: (context) => di.sl<HomepageBloc>(),
          ),
        ],
        child: BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) => current.maybeMap(
            auth: (value) {
              if (!started) {
                started = true;
                lastUser = value.user;
                return true;
              }

              final isDifferent = lastUser != value.user;
              lastUser = value.user;
              return isDifferent;
            },
            orElse: () => false,
          ),
          builder: (context, state) {
            return state.maybeMap(
              auth: (value) {
                if (value.user == null) return _loginPage(context);
                return _homePage(context, value.user!.email);
              },
              orElse: () {
                return currentUser == null
                    ? _loginPage(context)
                    : _homePage(context, currentUser.email!);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _loginPage(BuildContext context) {
    return BlocProvider.value(
      value: context.read<UserBloc>(),
      child: LoginPage(),
    );
  }

  Widget _homePage(BuildContext context, String email) {
    final homepageItemsBloc = di.sl<ItemsBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<HomepageBloc>()
            ..add(const HomepageEvent.setup())
            ..add(HomepageEvent.setupGameStream(itemsBloc: homepageItemsBloc)),
        ),
        BlocProvider.value(
          value: context.read<UserBloc>()..add(UserEvent.get(email)),
        ),
        BlocProvider(
          create: (context) => homepageItemsBloc,
        ),
      ],
      child: const Homepage(),
    );
  }
}
