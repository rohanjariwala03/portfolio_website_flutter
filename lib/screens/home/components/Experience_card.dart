import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Experience.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(height: 10,),
          Text(
            experience.description!,
            maxLines: Responsive.isMobileLarge(context) ? 5 : 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          ),
          // Spacer(),
        ],
      ),
    );
  }
}