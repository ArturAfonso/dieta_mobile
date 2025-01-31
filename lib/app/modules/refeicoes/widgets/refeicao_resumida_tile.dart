import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RefeicaoResumidaTile extends StatelessWidget {
  const RefeicaoResumidaTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.REFEICAOEDIT);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withAlpha(120)),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '20:00',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              VerticalDivider(
                color: Theme.of(context).colorScheme.outlineVariant.withAlpha(120),
                thickness: 2,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'X-tudo',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.circle,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
