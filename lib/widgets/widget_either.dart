import 'package:flutter/material.dart';

Widget textWidgetEither(BuildContext context,String? item) {

  if(item == null) {
    return const SizedBox.shrink();
  }

  return Text(
    item,
    style: Theme.of(context).textTheme.headline2
  );

}