class Specialisation {
  final String description;
  final String specialisation;
  final int specialisationid;
  bool selected; // Added property to track selection

  Specialisation({
    required this.description,
    required this.specialisation,
    required this.specialisationid,
    this.selected = false, // Default value for selected is false
  });
}