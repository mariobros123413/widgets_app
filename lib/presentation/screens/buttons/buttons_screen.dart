import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static final name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Icon(Icons.rowing_sharp),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated'),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Elevated Disabled'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Elevated Icon'),
            icon: const Icon(Icons.alarm_add_outlined),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Filled'),
          ),
          FilledButton.icon(
            onPressed: () {},
            label: const Text('Filled Icon'),
            icon: const Icon(Icons.person_2_outlined),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outline'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text('Outline Icon'),
            icon: const Icon(Icons.shuffle_outlined),
          ),
          //TODO: custom button
          TextButton(
            onPressed: () {},
            child: const Text('Text'),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('Text Icon'),
            icon: const Icon(Icons.person_add_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.app_registration_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.app_registration_outlined),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.primary),
              iconColor: const WidgetStatePropertyAll(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
