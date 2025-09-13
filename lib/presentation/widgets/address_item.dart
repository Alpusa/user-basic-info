import 'package:flutter/material.dart';
import '../widgets/confirm_delete_button.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

typedef AsyncVoidCallback = Future<void> Function();

class AddressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final AsyncVoidCallback? onDelete;
  final bool small;

  const AddressItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha((0.7 * 255).round()),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        if (onEdit != null)
          FilledButton.tonal(
            onPressed: onEdit,
            style: FilledButton.styleFrom(shape: const StadiumBorder()),
            child: Text(t.edit),
          ),
        if (onEdit != null && onDelete != null) const SizedBox(width: 8),
        if (onDelete != null)
          ConfirmDeleteButton(
            title: t.deleteAddress,
            message: t.confirmDeleteAddress,
            onConfirmed: onDelete!,
            small: true,
          ),
      ],
    );

    final wrapper = small
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: content,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: content,
          );

    if (onTap != null) {
      return InkWell(onTap: onTap, child: wrapper);
    }
    return wrapper;
  }
}
