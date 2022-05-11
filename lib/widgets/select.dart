import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final List<String> items;
  final String? value;
  const Select({Key? key, required this.items, this.value}) : super(key: key);

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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
          borderSide: const BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white)
        ),
        filled: true,
        fillColor: Colors.white
      ),
      hint: Container(
        alignment: Alignment.center,
        child: const Text(
          'Please, Select the course',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      onChanged: (value) {},
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      
    );

  }
}
