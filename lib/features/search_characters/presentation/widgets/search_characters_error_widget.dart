import 'package:flutter/material.dart';
import 'package:simpsonsviewer/core/utils/localization_utils.dart';

class SearchCharactersErrorWidget extends StatelessWidget {
  const SearchCharactersErrorWidget({
    super.key,
    required this.error,
    required this.onTryAgainPressed,
  });

  ///While this is not being used at the time, in a real application,
  ///this would be used to determine the error message
  final Object error;
  final VoidCallback onTryAgainPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 80.0,
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              context.appLocalizations.genericErrorMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )),
          FilledButton(
            onPressed: onTryAgainPressed,
            child: Text(context.appLocalizations.tryAgainButtonText),
          )
        ],
      ),
    );
  }
}
