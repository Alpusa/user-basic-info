import 'package:flutter/material.dart';
import '../widgets/confirm_delete_button.dart';

typedef AsyncVoidCallback = Future<void> Function();

class AddressItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final AsyncVoidCallback? onDelete;
  final bool small;

  const AddressItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        if (onEdit != null)
          FilledButton.tonal(
            onPressed: onEdit,
            style: FilledButton.styleFrom(shape: const StadiumBorder()),
            child: const Text('Editar'),
          ),
        if (onEdit != null && onDelete != null) const SizedBox(width: 8),
        if (onDelete != null)
          ConfirmDeleteButton(
            title: 'Eliminar dirección',
            message: '¿Deseas eliminar esta dirección?',
            onConfirmed: onDelete!,
            small: true,
          ),
      ],
    );

    final wrapper = small
        ? Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: content)
        : Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: content);

    if (onTap != null) {
      return InkWell(onTap: onTap, child: wrapper);
    }
    return wrapper;
  }
}
