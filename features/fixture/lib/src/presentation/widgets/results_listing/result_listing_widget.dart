import 'package:flutter/material.dart';
import 'package:common_dependencies/common_dependencies.dart';

class ResultListingWidget<T> extends StatelessWidget {
  final List<T> items;
  final Function(BuildContext context, T item) listItemBuilder;
  const ResultListingWidget({
    super.key,
    required this.items,
    required this.listItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return buildList(items);
  }

  Widget buildList(List<T> items) {
    return AnimationLimiter(
      child: ListView.separated(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 300),
            child: SlideAnimation(
              verticalOffset: MediaQuery.of(context).size.height* .3,
              child: FadeInAnimation(
                child: Column(
                    children: [
                      SizedBox(height: index == 0 ? 16 : 0,),
                      listItemBuilder(context, items[index],),
                      SizedBox(height: index == items.length - 1 ? 132 : 0,),
                    ]
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12,),
      ),
    );
  }

}
