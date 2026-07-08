import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class LoadingView extends StatelessWidget {
  final String? message;

  const LoadingView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            AppSpacing.gapMd,
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ]
        ],
      ),
    );
  }
}
