import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/edit_hangout/edit_hangout_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/edit_hangout_date_time_page.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'next_date.dart';
part 'next_time.dart';
part 'offline_button.dart';
part 'next_date_time_area.dart';

class TopArea extends StatelessWidget {
  const TopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _OfflineButton(),
            ],
          ),
          height10,
          Row(
            children: [
              const _NextDateTimeArea(),
              width10,
              Expanded(
                child: Image.asset(
                  'assets/images/table.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
