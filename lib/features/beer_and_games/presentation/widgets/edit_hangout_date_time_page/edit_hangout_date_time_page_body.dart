import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/edit_hangout/edit_hangout_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_section.dart';

class EditHangoutDateTimePageBody extends StatelessWidget {
  const EditHangoutDateTimePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          _GeneralSection(),
        ],
      ),
    );
  }
}
