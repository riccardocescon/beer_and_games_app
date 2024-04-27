import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/edit_hangout/edit_hangout_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/edit_hangout_date_time_page/edit_hangout_date_time_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditHangoutDateTimePage extends StatelessWidget {
  const EditHangoutDateTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: hangoutAppBar(context, title: 'Modifica Giorno/Ora'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<EditHangoutPageBloc>()
                .add(const EditHangoutPageEvent.save());
          },
          child: const Icon(Icons.save),
        ),
        body: BlocListener<EditHangoutPageBloc, EditHangoutPageState>(
          listener: (context, state) {
            state.maybeMap(
              saved: (_) {
                context.pop();
                context.successSnackbar(
                  'Salvato',
                  'Giorno e ora salvati con successo!',
                );
              },
              orElse: () {},
            );
          },
          child: const EditHangoutDateTimePageBody(),
        ),
      ),
    );
  }
}
