enum ConsultationType { chat, audio, video }

extension ConsultationTypeExt on ConsultationType {
  String get label {
    switch (this) {
      case ConsultationType.chat:
        return 'Chat';
      case ConsultationType.audio:
        return 'Audio Call';
      case ConsultationType.video:
        return 'Video Call';
    }
  }

  String get name {
    return label;
  }
}