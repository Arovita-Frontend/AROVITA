import 'package:flutter/material.dart';
import '../../../models/consultation_type.dart';

class ConsultationTypeSelector extends StatelessWidget {
  final ConsultationType? selected;
  final void Function(ConsultationType) onSelect;

  const ConsultationTypeSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  Widget _buildTile(BuildContext context, ConsultationType type, IconData icon) {
    final bool isSelected = selected == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelect(type),
        child: Container(
          height: 64,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepPurple : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? Colors.deepPurple : const Color(0xFFE7E6F3)),
            boxShadow: isSelected ? [BoxShadow(color: Colors.deepPurple.withOpacity(0.12), blurRadius: 8)] : null,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: isSelected ? Colors.white : Colors.grey),
                const SizedBox(width: 8),
                Text(
                  type.label,
                  style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTile(context, ConsultationType.chat, Icons.chat_bubble_outline),
        _buildTile(context, ConsultationType.audio, Icons.call_outlined),
        _buildTile(context, ConsultationType.video, Icons.videocam_outlined),
      ],
    );
  }
}