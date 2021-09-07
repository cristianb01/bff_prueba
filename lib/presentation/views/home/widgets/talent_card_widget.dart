import 'package:flutter/material.dart';

class TalentCardWidget extends StatelessWidget {
  final String talentImage;
  final String talentName;
  final String talentProfession;

  const TalentCardWidget(
      {Key? key,
      required this.talentImage,
      required this.talentName,
      required this.talentProfession})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: 152,
              height: 184,
              padding: EdgeInsets.only(bottom: 8),
              child: Image.network(this.talentImage)),
          Text(talentName),
          Text(talentProfession)
        ],
      ),
    );
  }
}
