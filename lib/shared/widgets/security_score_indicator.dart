import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SecurityScoreIndicator extends StatelessWidget {
  final int score; // 0 to 100

  const SecurityScoreIndicator({super.key, required this.score});

  Color _getScoreColor() {
    if (score >= 80) return AppColors.securityHigh;
    if (score >= 50) return AppColors.securityMedium;
    return AppColors.securityLow;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getScoreColor();
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            value: score / 100,
            color: color,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            strokeWidth: 6,
          ),
        ),
        Text(
          '$score',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
