import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_loading.dart';
import '../widgets/confirm_delete_button.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecases/delete_user.dart';
import '../../domain/usecases/delete_address.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_summary/user_summary_cubit.dart';
import '../bloc/user_summary/user_summary_state.dart';
import '../widgets/address_item.dart';
import '../../core/errors/failure.dart';
import '../../core/router/names_router.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class UserSummaryPage extends StatelessWidget {
  const UserSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSummaryCubit, UserSummaryState>(
      builder: (context, state) {
        if (state.isLoading && state.user == null) {
          return Scaffold(
            body: Center(child: AppLoading(message: AppLocalizations.of(context)!.loadingUser)),
          );
        }
        if (state.failure != null) {
          final Failure f = state.failure!;
          final t = AppLocalizations.of(context)!;
          final msg = f.when(
            unexpected: (m) => m ?? t.unexpectedError,
            network: (m) => m ?? t.networkError,
            notFound: (m) => m ?? t.notFoundError,
            validation: (m) => m ?? t.validationError,
          );
          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.userSummary)),
            body: Center(child: Text(msg)),
          );
        }
        final User? user = state.user;
        if (user == null) {
          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.userSummary)),
            body: Center(child: Text(AppLocalizations.of(context)!.userNotFound)),
          );
        }
        final theme = Theme.of(context);
        final onSurfaceSubtle = theme.colorScheme.onSurface.withOpacity(0.7);
        final fecha = user.fechaNacimiento
            .toLocal()
            .toString()
            .split(' ')
            .first;

        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.userSummary),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    '${user.nombre} ${user.apellido}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${AppLocalizations.of(context)!.id}: ${user.id}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: onSurfaceSubtle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!.birthDatePrefix(fecha),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: onSurfaceSubtle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.tonal(
                          onPressed: () async {
                            final result = await context.push(
                              '${NamesRouter.createEditUser}?id=${user.id}',
                            );
                            if (result == true && context.mounted) {
                              context.read<UserSummaryCubit>().load(user.id);
                            }
                          },
                          style: FilledButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                          child: Text(AppLocalizations.of(context)!.editAccount),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ConfirmDeleteButton(
                          title: AppLocalizations.of(context)!.deleteUser,
                          message: AppLocalizations.of(context)!.confirmDeleteUser,
                          onConfirmed: () async {
                            final deleteUser = GetIt.I<DeleteUser>();
                            final res = await deleteUser(user.id);
                            res.fold(
                              (f) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_failureMessage(context, f))),
                              ),
                              (_) {
                                Navigator.of(context).pop(true);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.registeredAddresses,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.addresses.isEmpty) ...[
                    Text(
                      AppLocalizations.of(context)!.noRegisteredAddresses,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: onSurfaceSubtle,
                      ),
                    ),
                  ] else ...[
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.addresses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final addr = state.addresses[index];
                        final title = addr.municipio.isNotEmpty
                            ? addr.municipio
                            : (addr.departamento.isNotEmpty
                                  ? addr.departamento
                                  : addr.pais);
                        final subtitle =
                            '${addr.direccion}${addr.municipio.isNotEmpty ? ', ${addr.municipio}' : ''}';
                        return AddressItem(
                          title: title,
                          subtitle: subtitle,
                          onTap: () async {
                            final id = addr.id;
                            if (id == null || id.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                              );
                              return;
                            }
                            final result = await context.push(
                              '${NamesRouter.createEditAddress}?id=$id',
                            );
                            if (result == true && context.mounted) {
                              context.read<UserSummaryCubit>().load(user.id);
                            }
                          },
                          onEdit: () async {
                            final id = addr.id;
                            if (id == null || id.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                              );
                              return;
                            }
                            final result = await context.push(
                              '${NamesRouter.createEditAddress}?id=$id',
                            );
                            if (result == true && context.mounted) {
                              context.read<UserSummaryCubit>().load(user.id);
                            }
                          },
                          onDelete: () async {
                            final id = addr.id;
                            if (id == null || id.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                              );
                              return;
                            }
                            final deleteAddress = GetIt.I<DeleteAddress>();
                            final res = await deleteAddress(id);
                            res.fold(
                              (f) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_failureMessage(context, f))),
                              ),
                              (_) async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(AppLocalizations.of(context)!.addressDeleted)),
                                );
                                context.read<UserSummaryCubit>().load(user.id);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () async {
                        final uid = user.id;
                        final result = await context.push(
                          '${NamesRouter.createEditAddress}?userId=$uid',
                        );
                        if (result == true && context.mounted) {
                          context.read<UserSummaryCubit>().load(uid);
                        }
                      },
                      style: FilledButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: const Icon(Icons.add),
                      label: Text(AppLocalizations.of(context)!.addNewAddress),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

String _failureMessage(BuildContext context, Failure failure) {
  final t = AppLocalizations.of(context)!;
  return failure.when(
    unexpected: (m) => m ?? t.unexpectedError,
    network: (m) => m ?? t.networkError,
    notFound: (m) => m ?? t.notFoundError,
    validation: (m) => m ?? t.validationError,
  );
}

// _AddressItem reemplazado por el widget reutilizable AddressItem
