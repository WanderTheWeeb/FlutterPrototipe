import 'package:MindWell/utils/drawer.dart';
import 'package:MindWell/utils/my_widgets/TextSectionV1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart';
import '../cubit/profile/profiles_cubit.dart';
import '../cubit/rooms/rooms_cubit.dart';
import '../models/profile.dart';
import '../utils/constants.dart';
import 'chat_page.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider<RoomCubit>(
        create: (context) => RoomCubit()..initializeRooms(context),
        child: const RoomsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        automaticallyImplyLeading: false,
        title: const Text('Rooms'),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state is RoomsLoading) {
            return preloader;
          } else if (state is RoomsLoaded) {
            final newUsers = state.newUsers;
            final rooms = state.rooms;
            return BlocBuilder<ProfilesCubit, ProfilesState>(
              builder: (context, state) {
                if (state is ProfilesLoaded) {
                  final profiles = state.profiles;
                  return Column(
                    children: [
                      _NewUsers(newUsers: newUsers),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: rooms.length,
                          itemBuilder: (context, index) {
                            final room = rooms[index];
                            final otherUser = profiles[room.otherUserId];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 2, top: 2),
                              child: Material(
                                // Agregar un borde al Material que envuelve al ListTile
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0), // Ajusta el radio según sea necesario
                                  side: BorderSide(color: Theme.of(context).primaryColor), // Color del borde
                                ),
                                child: ListTile(
                                  onTap: () => Navigator.of(context).push(ChatPage.route(room.id)),
                                  leading: CircleAvatar(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: otherUser == null
                                        ? preloader
                                        : Text(otherUser.username.substring(0, 2)),
                                  ),
                                  title: Text(
                                    otherUser == null ? 'Cargando...' : otherUser.username,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  subtitle: room.lastMessage != null
                                      ? Text(
                                    room.lastMessage!.content,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.black),
                                  )
                                      : Text('Chat creado',
                                      style: TextStyle(color: Theme.of(context).primaryColor)),
                                  trailing: Text(
                                    format(
                                        room.lastMessage?.createdAt ?? room.createdAt,
                                        locale: 'en_short'),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  tileColor: Colors.grey[200],
                                ),
                              ),
                            );

                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return preloader;
                }
              },
            );
          } else if (state is RoomsEmpty) {
            final newUsers = state.newUsers;
            return Column(
              children: [
                _NewUsers(newUsers: newUsers),
                 Expanded(
                  child: Center(
                    child: ListView(
                      children: [
                        TextSectionV1('Inicia una conversación', 'Reconocer la necesidad de apoyo emocional es un acto de autenticidad y fortaleza, y tu decisión demuestra un profundo compromiso contigo mismo'),
                        Container(height: 300,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/RoomsEmpty.png')))),

                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RoomsError) {
            return Center(child: Text(state.message));
          }
          throw UnimplementedError();
        },
      ),
    );
  }
}

class _NewUsers extends StatelessWidget {
  const _NewUsers({
    Key? key,
    required this.newUsers,
  }) : super(key: key);

  final List<Profile> newUsers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newUsers
            .map<Widget>((user) => InkWell(
                  onTap: () async {
                    try {
                      final roomId = await BlocProvider.of<RoomCubit>(context)
                          .createRoom(user.id);
                      Navigator.of(context).push(ChatPage.route(roomId));
                    } catch (_) {
                      context.showErrorSnackBar(
                          message: 'Error al crear el chat');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(user.username.substring(0, 2)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user.username,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
