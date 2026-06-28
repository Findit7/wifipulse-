import 'package:flutter/material.dart';
import '../../domain/entities/security_score_entity.dart';
import '../../../../core/theme/app_colors.dart';

class SecurityScoreGauge extends StatelessWidget {
  final SecurityScoreEntity scoreEntity;

  const SecurityScoreGauge({super.key, required this.scoreEntity});

  @override
  Widget build(BuildContext context) {
    Color getRiskColor() {
      switch (scoreEntity.riskLevel) {
        case 'Critical': return AppColors.error;
        case 'High': return Colors.orange;
        case 'Medium': return Colors.yellow;
        default: return AppColors.success;
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: scoreEntity.overallScore / 100,
                  strokeWidth: 12,
                  backgroundColor: AppColors.surfaceHighlight,
                  color: getRiskColor(),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${scoreEntity.overallScore}', style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold, color: getRiskColor())),
                  Text('Score', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetric('Passed', scoreEntity.passedChecks.length, AppColors.success),
              _buildMetric('Failed', scoreEntity.failedChecks.length, AppColors.error),
              _buildMetric('Unsupported', scoreEntity.unsupportedChecks.length, AppColors.textSecondary),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMetric(String label, int count, Color color) {
    return Column(
      children: [
        Text('$count', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}
