import 'package:bff_prueba/core/ui/loading.dart';
import 'package:bff_prueba/core/ui/show_message.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/presentation/cubit/relevant_talents/relevant_talents_cubit.dart';
import 'package:bff_prueba/presentation/views/home/widgets/talent_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bff_prueba/injection_container.dart';

class RelevantTalentsWidget extends StatelessWidget {
  const RelevantTalentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _mainContainer(List<Talent> relevantTalents) {
      return Padding(
        padding: EdgeInsets.only(top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Talentos destacados'),
            ...relevantTalents
                .map((talent) => TalentCardWidget(
                    talentImage: talent.profileImageUrl,
                    talentName: '${talent.firstName} ${talent.lastName ?? ''}',
                    talentProfession: talent.profession))
                .toList()
          ],
        ),
      );
    }

    return BlocProvider(
        create: (context) => sl<RelevantTalentsCubit>(),
        child: BlocBuilder<RelevantTalentsCubit, RelevantTalentsState>(
          builder: (context, state) {
            if (state is RelevantTalentsInitial) {
              _getRelevantTalents(context);
              return Loading();
            } else if (state is RelevantTalentsLoaded) {
              final relevantTalents = state.talents;
              return _mainContainer(relevantTalents);
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
