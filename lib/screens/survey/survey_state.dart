class SurveyState {
  String? activityLevel;
  String? smoking;
  String? alcohol;
  String? sleep;
  String? stress;

  bool isComplete() {
    return activityLevel != null &&
        smoking != null &&
        alcohol != null &&
        sleep != null &&
        stress != null;
  }
}