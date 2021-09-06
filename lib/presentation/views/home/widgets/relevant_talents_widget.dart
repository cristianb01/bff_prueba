import 'package:bff_prueba/core/ui/loading.dart';
import 'package:bff_prueba/core/ui/show_message.dart';
import 'package:bff_prueba/presentation/cubit/relevant_talents/relevant_talents_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bff_prueba/injection_container.dart';

class RelevantTalentsWidget extends StatelessWidget {
  const RelevantTalentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<RelevantTalentsCubit>(),
        child: BlocBuilder<RelevantTalentsCubit, RelevantTalentsState>(
          builder: (context, state) {
            if (state is RelevantTalentsInitial) {
              _getRelevantTalents(context);
              return Loading();
            } else if (state is RelevantTalentsLoaded) {
              final relevantStates = state.talents;
            } else if (state is RelevantTalentsLoading) {
              return Loading();
            } else if (state is RelevantTalentsError) {
              return ShowMessage(message: state.message).show();
            }
            return Container();
          },
        ));
  }

  void _getRelevantTalents(BuildContext context) {
    final relevantTalentsCubit = context.read<RelevantTalentsCubit>();
    relevantTalentsCubit.getAllRelevantTalents();
  }
}
