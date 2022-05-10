import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final List<String> items;
  const Select({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      items: items.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Text(
          e,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

      )).toList(),
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        
      ),
      hint: const Text(
        'Please, Select the course',
        style: TextStyle(fontSize: 14),
      ),
      onChanged: (value) {},
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
    );

  }
}
