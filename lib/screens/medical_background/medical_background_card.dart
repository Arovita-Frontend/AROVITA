import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../utils/file_upload_box.dart';

class MedicalBackgroundCard extends StatefulWidget {
  const MedicalBackgroundCard({super.key});

  @override
  State<MedicalBackgroundCard> createState() => _MedicalBackgroundCardState();
}

class _MedicalBackgroundCardState extends State<MedicalBackgroundCard> {
  bool takingMedicines = false;

  FilePickerResult? uploadedFile;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      withData: true, // important for size check
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      // Check 5MB limit (5 × 1024 × 1024 = 5242880 bytes)
      if (file.size > 5 * 1024 * 1024) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("File must be less than 5MB")),
        );
        return;
      }

      setState(() {
        uploadedFile = result;
      });
    }
  }

  // NEW STATE (from second code)
  List<String> selectedConditions = [];
  List<String> selectedAllergies = [];

  // NEW OPTION LISTS
  final List<String> chronicConditions = [
    "Diabetes",
    "Hypertension",
    "Asthma",
    "Thyroid Issues",
    "Heart Disease",
    "PCOS / PCOD",
    "Other",
  ];

  final List<String> allergies = [
    "Food Allergy",
    "Dust Allergy",
    "Pollen Allergy",
    "Drug Allergy",
    "Other",
  ];

  // NEW TOGGLE FUNCTION
  void toggleSelection(List<String> selectedList, String item) {
    setState(() {
      if (selectedList.contains(item)) {
        selectedList.remove(item);
      } else {
        selectedList.add(item);
      }
    });
  }

  // NEW TWO-COLUMN CHIP BUILDER
  Widget buildTwoColumnChips({
    required List<String> items,
    required List<String> selectedList,
    required double chipHeight,
    required double fontSize,
  }) {
    List<Widget> rows = [];

    for (int i = 0; i < items.length; i += 2) {
      bool isLast = i == items.length - 1;

      if (isLast) {
        rows.add(
          GestureDetector(
            onTap: () => toggleSelection(selectedList, items[i]),
            child: Container(
              width: double.infinity,
              height: chipHeight,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: selectedList.contains(items[i])
                    ? const Color(0xff4C1EFF)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(
                items[i],
                style: TextStyle(
                  fontSize: fontSize,
                  color: selectedList.contains(items[i])
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      } else {
        rows.add(
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => toggleSelection(selectedList, items[i]),
                  child: Container(
                    height: chipHeight,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 8, bottom: 12),
                    decoration: BoxDecoration(
                      color: selectedList.contains(items[i])
                          ? const Color(0xff4C1EFF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      items[i],
                      style: TextStyle(
                        fontSize: fontSize,
                        color: selectedList.contains(items[i])
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              if (i + 1 < items.length)
                Expanded(
                  child: GestureDetector(
                    onTap: () => toggleSelection(selectedList, items[i + 1]),
                    child: Container(
                      height: chipHeight,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: selectedList.contains(items[i + 1])
                            ? const Color(0xff4C1EFF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text(
                        items[i + 1],
                        style: TextStyle(
                          fontSize: fontSize,
                          color: selectedList.contains(items[i + 1])
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double titleSize = width > 800 ? 24 : 20;
    double subtitleSize = width > 800 ? 15 : 13;
    double labelSize = width > 800 ? 15 : 13;
    double chipHeight = width > 800 ? 50 : 42;
    double paddingResponsive = Responsive.isMobile ? 0 : 20;

    return Container(
      padding: EdgeInsets.all(paddingResponsive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + Subtitle
          Text(
            "Your Medical Background",
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Helps doctors understand your health history better.",
            style: TextStyle(fontSize: subtitleSize, color: Colors.black54),
          ),
          const SizedBox(height: 25),

          // --- SURGERIES INPUT ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Have you had any surgeries before?",
                  style: TextStyle(fontSize: labelSize),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "e.g., appendix removal in 2019",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- MEDICINES TOGGLE ---
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Are you currently taking any medicines?",
                  style: TextStyle(fontSize: labelSize),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _pillButton("None", !takingMedicines, () {
                      setState(() => takingMedicines = false);
                    }),
                    const SizedBox(width: 10),
                    _pillButton("Yes", takingMedicines, () {
                      setState(() => takingMedicines = true);
                    }),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- FILE UPLOAD ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload prescription or photo of medication (Optional)",
                  style: TextStyle(fontSize: labelSize),
                ),
                const SizedBox(height: 12),

                FileUploadBox(
                  onTap: pickFile,
                  onRemove: () {
                    setState(() {
                      uploadedFile = null;
                    });
                  },
                  uploadedFile: uploadedFile,
                  width: MediaQuery.of(context).size.width,
                  labelSize: labelSize,
                  subtitleSize: subtitleSize,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // --- CHRONIC CONDITIONS ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you have any chronic conditions?",
                  style: TextStyle(fontSize: labelSize),
                ),

                const SizedBox(height: 12),

                buildTwoColumnChips(
                  items: chronicConditions,
                  selectedList: selectedConditions,
                  chipHeight: chipHeight,
                  fontSize: labelSize,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // --- ALLERGIES ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Any known allergies? (Optional)",
                  style: TextStyle(fontSize: labelSize),
                ),

                const SizedBox(height: 12),

                buildTwoColumnChips(
                  items: allergies,
                  selectedList: selectedAllergies,
                  chipHeight: chipHeight,
                  fontSize: labelSize,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // --- BUTTON ---
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF714BFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/emergency_contacts');
              },
              child: Text(
                "Save & Continue",
                style: TextStyle(fontSize: labelSize + 1, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // --- SKIP ---
          Center(
            child: MouseRegion(
              cursor:
                  SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/emergency_contacts',
                  );
                },
                child: Text(
                  "Skip for now",
                  style: TextStyle(fontSize: labelSize, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets --- //

  Widget _pillButton(String text, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: active ? const Color(0xFF714BFE) : Colors.white,
            border: Border.all(
              color: active ? Colors.transparent : Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: active ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
