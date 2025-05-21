class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String credential;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Self-Taught Flutter Developer',
    organization: 'Self-Learning',
    date: 'Ongoing',
    skills: 'Flutter, Dart, Firebase, BLoC, Socket.io',
    credential: ''
  ),
  CertificateModel(
    name: 'Chief Technology Officer (CTO)',
    organization: 'Aanajawala',
    date: 'JAN 2024 - Present',
    skills: 'Leadership . Flutter . Backend Development . System Architecture',
    credential: 'https://anajwala.com/'  // Updated URL with https protocol
  ),
];

