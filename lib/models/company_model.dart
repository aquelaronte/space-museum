class Headquarters {
  final String address;
  final String city;
  final String state;

  Headquarters(
      {required this.address, required this.city, required this.state});

  static Headquarters fromMap({required Map map}) => Headquarters(
      address: map['address'], city: map['city'], state: map['state']);
}

class Links {
  final String elonTwitter;
  final String flickr;
  final String twitter;
  final String website;

  Links(
      {required this.elonTwitter,
      required this.flickr,
      required this.twitter,
      required this.website});

  static Links fromMap({required Map map}) => Links(
      elonTwitter: map['elon_twitter'],
      flickr: map['flickr'],
      twitter: map['twitter'],
      website: map['website']);
}

class CompanyModel {
  final int employees;
  final int founded;
  final String founder;
  final Headquarters headquarters;
  final int launchSites;
  final Links links;
  final String name;
  final String summary;
  final int testSites;
  final double valuation;
  final int vehicles;
  final String ceo;

  CompanyModel(
      {required this.employees,
      required this.founded,
      required this.founder,
      required this.headquarters,
      required this.launchSites,
      required this.links,
      required this.name,
      required this.summary,
      required this.testSites,
      required this.valuation,
      required this.vehicles,
      required this.ceo});

  static CompanyModel fromMap({required Map map}) => CompanyModel(
      employees: map['employees'],
      founded: map['founded'],
      founder: map['founder'],
      headquarters: Headquarters.fromMap(map: map['headquarters']),
      launchSites: map['launch_sites'],
      links: Links.fromMap(map: map['links']),
      name: map['name'],
      summary: map['summary'],
      testSites: map['test_sites'],
      valuation: map['valuation'].toDouble(),
      vehicles: map['vehicles'],
      ceo: map['ceo']);
}
