import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu-items.dart';

class HomeScreen extends StatelessWidget {
  static final name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push( // OPCION 1 MUY LARGO Y TEDIOSO, PERMITE DEEP LINKS
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen()),
        // );
        // Navigator.of(context).pushNamed(menuItem.link); // OPCION 2 (NO PERMITE CUSTOMIZAR DEEP LINKing)

        context.push(menuItem.link); //OPCION 3 USO DE GO ROUTER
        // context.pushNamed(CardsScreen.name); // CON NAME, PERO HAY QUE AGREGAR NAME A LA CLASS MENUITEMS.Name
      },
    );
  }
}
