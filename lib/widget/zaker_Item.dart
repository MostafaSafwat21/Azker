import 'package:flutter/material.dart';

class AzkarItem extends StatelessWidget {
  final item;
  final VoidCallback onTap;

  const AzkarItem({required this.item, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 6.0, horizontal: 14.0,
        ),
        child: Column(
          children: [
            Text(
              item.content,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.black87,
              ),
            ),
            if (item.description.isNotEmpty)
              Text(
                item.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.teal.shade500,
                ),
              ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              color: Colors.greenAccent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.count == 0)
                    Text(
                      ' تم بحمد الله ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  if (item.count > 0)
                    Text(
                      " ${item.count} ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
