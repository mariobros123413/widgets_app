import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Ad laborum irure laboris nisi enim dolor commodo voluptate officia. Proident dolor deserunt ullamco labore duis in officia amet eu proident aliquip sit.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Esse nisi aliquip laborum magna. Id elit Lorem exercitation non aliquip ipsum qui irure sint elit amet laborum anim. Ut id tempor consequat occaecat eiusmod anim eu quis deserunt commodo cupidatat.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Qui sunt adipisicing consequat cupidatat cillum. Enim nisi ut Lorem irure aliquip ullamco mollit nisi dolor tempor.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();
    pageviewController.addListener(
      () {
        final page = pageviewController.page ?? 0;
        if (!endReached && page >= slides.length - 1.5) {
          setState(() {
            endReached = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
