class random {
  final dynamic nameFirst;
  final dynamic nameLast;
  final dynamic nameTitle;

  final dynamic gender;

  final dynamic streetNumber;
  final dynamic streetName;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic postcode;

  final dynamic email;

  final dynamic birthdate;
  final dynamic age;

  final dynamic phone;

  final dynamic image;

  random({
    required this.nameFirst,
    required this.nameLast,
    required this.nameTitle,
    required this.gender,
    required this.streetNumber,
    required this.streetName,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.email,
    required this.birthdate,
    required this.age,
    required this.phone,
    required this.image,
  });

  factory random.fromJson({required Map json}) {
    return random(
        nameFirst: json['results'][0]['name']['first'],
        nameLast: json['results'][0]['name']['last'],
        nameTitle: json['results'][0]['name']['title'],
        gender: json['results'][0]['gender'],
        streetNumber: json['results'][0]['location']['street']['number'],
        streetName: json['results'][0]['location']['street']['name'],
        city: json['results'][0]['location']['city'],
        state: json['results'][0]['location']['state'],
        country: json['results'][0]['location']['country'],
        postcode: json['results'][0]['location']['postcode'],
        email: json['results'][0]['email'],
        birthdate: json['results'][0]['dob']['date'],
        age: json['results'][0]['dob']['age'],
        phone: json['results'][0]['phone'],
        image: json['results'][0]['picture']['large']);
  }
}
