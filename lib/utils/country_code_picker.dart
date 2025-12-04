import 'package:flutter/material.dart';

class CountryCode {
  final String name;
  final String code;
  final String dialCode;
  final String flag;

  CountryCode({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
  });
}

final List<CountryCode> countryCodes = [
  CountryCode(name: "India", code: "IN", dialCode: "+91", flag: "🇮🇳"),
  CountryCode(name: "United States", code: "US", dialCode: "+1", flag: "🇺🇸"),
  CountryCode(name: "United Kingdom", code: "GB", dialCode: "+44", flag: "🇬🇧"),
  CountryCode(name: "Canada", code: "CA", dialCode: "+1", flag: "🇨🇦"),
  CountryCode(name: "Australia", code: "AU", dialCode: "+61", flag: "🇦🇺"),
  CountryCode(name: "Singapore", code: "SG", dialCode: "+65", flag: "🇸🇬"),
  CountryCode(name: "Germany", code: "DE", dialCode: "+49", flag: "🇩🇪"),
  CountryCode(name: "UAE", code: "AE", dialCode: "+971", flag: "🇦🇪"),
];

class CountryCodePicker extends StatefulWidget {
  final CountryCode? initialSelection;
  final Function(CountryCode) onChanged;
  final double scale;

  const CountryCodePicker({
    super.key,
    this.initialSelection,
    required this.onChanged,
    required this.scale,
  });

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  late CountryCode selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelection ?? countryCodes.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<CountryCode>(
        value: selected,
        isDense: true,
        icon: const Icon(Icons.arrow_drop_down, size: 18),

        dropdownColor: const Color.fromARGB(255, 226, 233, 226),

        menuMaxHeight: 350,

        onChanged: (value) {
          if (value != null) {
            setState(() => selected = value);
            widget.onChanged(value);
          }
        },

        items: countryCodes.map((country) {
          return DropdownMenuItem(
            value: country,
            child: SizedBox(
              child: Row(
                children: [
                  Text(country.flag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${country.name} (${country.dialCode})",
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),

        selectedItemBuilder: (BuildContext context) {
          return countryCodes.map((country) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(country.flag, style: TextStyle(fontSize: 18 * widget.scale)),
                const SizedBox(width: 6),
                Text(
                  country.dialCode,
                  style: TextStyle(
                    fontSize: 16 * widget.scale,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          }).toList();
        },
      ),
    );
  }
}
