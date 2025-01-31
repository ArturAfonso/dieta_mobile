import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    const Icon(
                      PhosphorIcons.forkKnife,
                      size: 55.0,
                      weight: 500,
                      semanticLabel: 'Logo do app',
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Dieta',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'Mobile',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Hero(
                tag: 'user-avatar',
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
