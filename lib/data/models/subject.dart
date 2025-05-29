class Subject {

  final String id;
  final String nameAr;
  final String nameEn;
  final String prompt;

  Subject({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.prompt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      prompt: json['prompt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'prompt': prompt,
    };
  }

  static List<Subject> subjects = [
    Subject(
      id: '1',
      nameAr: 'العلوم',
      nameEn: 'Science',
      prompt: 'in field of Science',
    ),
    Subject(
      id: '2',
      nameAr: 'الكيمياء',
      nameEn: 'Chemistry',
      prompt: 'in field of Chemistry',
    ),
    Subject(
      id: '3',
      nameAr: 'الرياضيات',
      nameEn: 'Mathematics',
      prompt: 'in field of Mathematics',
    ),
  ];

}
