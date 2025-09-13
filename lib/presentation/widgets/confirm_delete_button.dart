import 'package:flutter/material.dart';
import '../../core/utils/dialogs.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class ConfirmDeleteButton extends StatelessWidget {
  final String title;
  final String message;
  final Future<void> Function() onConfirmed;
  final EdgeInsetsGeometry? padding;
  final bool small;

  const ConfirmDeleteButton({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirmed,
    this.padding,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final button = FilledButton.tonal(
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
        shape: const StadiumBorder(),
        padding: small
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
            : null,
      ),
      onPressed: () async {
        final ok = await showConfirmDialog(
          context,
          title: title,
          message: message,
          confirmText: t.delete,
          cancelText: t.cancel,
          isDestructive: true,
        );
        if (ok) await onConfirmed();
      },
      child: Text(small ? t.delete : title),
    );
    if (padding != null) return Padding(padding: padding!, child: button);
    return button;
  }
}
