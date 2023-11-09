import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile/profiles_cubit.dart';
import '../utils/constants.dart';

/// Widget that will display a user's avatar
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesCubit, ProfilesState>(
      builder: (context, state) {
        if (state is ProfilesLoaded) {
          final user = state.profiles[userId];
          return CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child:
            user == null ? preloader : Text(user.username.substring(0, 2)),
          );
        } else {
          return const CircleAvatar(child: preloader);
        }
      },
    );
  }
}