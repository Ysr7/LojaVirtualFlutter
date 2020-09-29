import 'package:flutter/material.dart';


import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              const DrawerTile(
                iconData: Icons.home,
                title: 'Início',
                page: 0,
              ),
              const DrawerTile(
                iconData: Icons.list,
                title: 'Produtos',
                page: 1,
              ),
              const DrawerTile(
                iconData: Icons.playlist_add_check,
                title: 'Meus Pedidos',
                page: 2,
              ),
              const DrawerTile(
                iconData: Icons.location_on,
                title: 'Lojas',
                page: 3,
              ),
              // Consumer<UserManager>(
              //   builder: (_, userManager, __){
              //     if(userManager.adminEnabled){
              //       return Column(
              //         children: <Widget>[
              //           const Divider(),
              //           DrawerTile(
              //             iconData: Icons.settings,
              //             title: 'Usuários',
              //             page: 4,
              //           ),
              //           DrawerTile(
              //             iconData: Icons.settings,
              //             title: 'Pedidos',
              //             page: 5,
              //           ),
              //         ],
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // )
            ],
          ),
        ],
      ),
    );
  }
}