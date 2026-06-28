import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildAction(context, 'Speed Test', Icons.network_check, () {}),
          const SizedBox(width: 12),
          _buildAction(context, 'Scan', Icons.radar, () {}),
          const SizedBox(width: 12),
          _buildAction(context, 'Refresh', Icons.refresh, () {}),
          const SizedBox(width: 12),
          _buildAction(context, 'Share QR', Icons.qr_code, () {}),
        ],
      ),
    );
  }

  Widget _buildAction(
      BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceHighlight.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.surfaceHighlight),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.textPrimary),
            const SizedBox(height: 8),
            Text(label,
                style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
