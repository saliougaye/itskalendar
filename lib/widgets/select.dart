import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final List<String> items;
  final String? value;
  final void Function(String?) onChange;

  const Select({Key? key, required this.items, this.value, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: value,
      items: items.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            e,
            style: Theme.of(context).textTheme.button,
            textAlign: TextAlign.center,
          ),
        ),
      )).toList(),
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).focusColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).focusColor)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).focusColor)
        ),
        filled: true,
        fillColor: Theme.of(context).focusColor
      ),
      hint: Container(
        alignment: Alignment.center,
        child: Text(
          'Please, Select the course',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      onChanged: onChange,
      iconSize: 30,
      buttonHeight: 50,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).focusColor
      ),
      
    );

  }
}
