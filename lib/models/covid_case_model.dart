class CovidCase {
  final int globalTotalNewConfirmed;
  final int globalTotalConfirmed;
  final int globalNewDeaths;
  final int globalTotalDeaths;
  final int globalNewRecovered;
  final int globalTotalRecovered;
  final List<Country> countries;

  CovidCase({
    required this.globalTotalNewConfirmed,
    required this.globalTotalConfirmed,
    required this.globalNewDeaths,
    required this.globalTotalDeaths,
    required this.globalNewRecovered,
    required this.globalTotalRecovered,
    required this.countries,
  });

  factory CovidCase.fromMap({required Map data}) {
    return CovidCase(
      globalTotalNewConfirmed: data['Global']['NewConfirmed'],
      globalTotalConfirmed: data['Global']['TotalConfirmed'],
      globalNewDeaths: data['Global']['NewDeaths'],
      globalTotalDeaths: data['Global']['TotalDeaths'],
      globalNewRecovered: data['Global']['NewRecovered'],
      globalTotalRecovered: data['Global']['TotalRecovered'],
      countries: (data['Countries'] != null)
          ? data['Countries']
              .map<Country>((e) => Country.fromMap(data: e))
              .toList()
          : [],
    );
  }
}

class Country {
  final String country;
  final String countryCode;
  final int countryTotalNewConfirmed;
  final int countryTotalConfirmed;
  final int countryNewDeaths;
  final int countryTotalDeaths;
  final int countryNewRecovered;
  final int countryTotalRecovered;

  Country({
    required this.country,
    required this.countryCode,
    required this.countryTotalNewConfirmed,
    required this.countryTotalConfirmed,
    required this.countryNewDeaths,
    required this.countryTotalDeaths,
    required this.countryNewRecovered,
    required this.countryTotalRecovered,
  });

  factory Country.fromMap({required Map data}) {
    return Country(
      country: data['Country'],
      countryCode: data['CountryCode'],
      countryTotalNewConfirmed: data['NewConfirmed'],
      countryTotalConfirmed: data['TotalConfirmed'],
      countryNewDeaths: data['NewDeaths'],
      countryTotalDeaths: data['TotalDeaths'],
      countryNewRecovered: data['NewRecovered'],
      countryTotalRecovered: data['TotalRecovered'],
    );
  }
}
