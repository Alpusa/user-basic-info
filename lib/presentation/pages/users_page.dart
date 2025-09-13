import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/user.dart';
import '../../core/router/names_router.dart';
import '../../l10n/app_localizations.dart';
import '../bloc/users_list/users_list_bloc.dart';
import '../bloc/users_list/users_list_state.dart';
import '../bloc/users_list/users_list_event.dart';
import '../widgets/app_loading.dart';
import '../../core/errors/failure.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = v.trim();
      final bloc = context.read<UsersListBloc>();
      if (query.isEmpty) {
        bloc.add(const UsersListEvent.loadRequested());
      } else {
        bloc.add(UsersListEvent.searchRequested(query));
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.users),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.refresh,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final query = _searchCtrl.text.trim();
              final bloc = context.read<UsersListBloc>();
              if (query.isEmpty) {
                bloc.add(const UsersListEvent.loadRequested());
              } else {
                bloc.add(UsersListEvent.searchRequested(query));
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await context.push(NamesRouter.createEditUser);
              if (result == true && context.mounted) {
                context.read<UsersListBloc>().add(
                  const UsersListEvent.loadRequested(),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchCtrl,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: AppLocalizations.of(context)!.searchUsers,
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _searchCtrl,
                  builder: (context, value, _) {
                    if (value.text.isEmpty) return const SizedBox.shrink();
                    return IconButton(
                      tooltip: AppLocalizations.of(context)!.clear,
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchCtrl.clear();
                        context.read<UsersListBloc>().add(
                          const UsersListEvent.loadRequested(),
                        );
                      },
                    );
                  },
                ),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<UsersListBloc>().add(
                  const UsersListEvent.loadRequested(),
                );
              },
              child: BlocBuilder<UsersListBloc, UsersListState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 240),
                        AppLoading(message: AppLocalizations.of(context)!.loadingUsers),
                      ],
                    ),
                    loading: () => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 240),
                        AppLoading(message: AppLocalizations.of(context)!.loadingUsers),
                      ],
                    ),
                    failure: (failure) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 240),
                        Center(child: Text(_failureMessage(context, failure))),
                      ],
                    ),
                    success: (users) {
                      if (users.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            const SizedBox(height: 240),
                            Center(child: Text(AppLocalizations.of(context)!.noUsers)),
                          ],
                        );
                      }
                      return ListView.separated(
                        itemCount: users.length,
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return _UserTile(user: user);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: AppLocalizations.of(context)!.createUser,
        onPressed: () async {
          final result = await context.push(NamesRouter.createEditUser);
          if (result == true && context.mounted) {
            context.read<UsersListBloc>().add(
              const UsersListEvent.loadRequested(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
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
}

class _UserTile extends StatelessWidget {
  final User user;
  const _UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    final initials =
        '${user.nombre.isNotEmpty ? user.nombre[0] : ''}${user.apellido.isNotEmpty ? user.apellido[0] : ''}'
            .toUpperCase();
    return ListTile(
      leading: CircleAvatar(child: Text(initials)),
      title: Text('${user.nombre} ${user.apellido}'),
      onTap: () async {
        await context.push('${NamesRouter.viewUser}?id=${user.id}');
        if (context.mounted) {
          context.read<UsersListBloc>().add(
            const UsersListEvent.loadRequested(),
          );
        }
      },
    );
  }
}
