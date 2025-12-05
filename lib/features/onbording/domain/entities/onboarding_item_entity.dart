class OnboardingItemEntity {
  final String image;
  final String overlay;
  final String text;
  final String subText;

  const OnboardingItemEntity({
    required this.image,
    required this.overlay,
    required this.text,
    required this.subText,
  });

  factory OnboardingItemEntity.fromJson(Map<String, dynamic> json) {
    return OnboardingItemEntity(
      image: json['image'] as String,
      overlay: json['overlay'] as String,
      text: json['text'] as String,
      subText: json['subText'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'overlay': overlay,
      'text': text,
      'subText': subText,
    };
  }
}
