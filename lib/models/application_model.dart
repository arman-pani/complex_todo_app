class ApplicationModel {
  final String name;
  final int hrsSpent;
  final String logoLink;

  ApplicationModel({
    required this.name,
    required this.hrsSpent,
    required this.logoLink,
  });
}

final dummyApplicationList = [
  ApplicationModel(
    name: 'Instagram',
    hrsSpent: 1,
    logoLink:
        'https://upload.wikimedia.org/wikipedia/commons/e/e7/Instagram_logo_2016.svg',
  ),
  ApplicationModel(
    name: 'Telegram',
    hrsSpent: 1,
    logoLink:
        'https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg',
  ),
  ApplicationModel(
    name: 'Facebook',
    hrsSpent: 2,
    logoLink:
        'https://upload.wikimedia.org/wikipedia/en/0/04/Facebook_f_logo_%282021%29.svg',
  ),
];
