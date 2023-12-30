import 'package:flutter/material.dart';
import 'package:simpsonsviewer/core/utils/localization_utils.dart';

class CharacterDescription extends StatelessWidget {
  const CharacterDescription({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    var onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  context.appLocalizations.characterDetailsTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: onPrimaryContainer),
                ),
              ),
            ),
            Flexible(
              child: Text(
                description,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: onPrimaryContainer),
              ),
            )
          ],
        ),
      ),
    );
  }
}
