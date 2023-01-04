import 'dart:developer';

import 'package:covid_19_tracker_app/helpers/covid_api_helper.dart';
import 'package:covid_19_tracker_app/models/covid_case_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late Future<CovidCase?> getCovidCaseData;

  @override
  void initState() {
    getCovidCaseData = CovidAPIHelper.covidAPIHelper.fetchAllData();

    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19 Tracker"),
        foregroundColor: Colors.white,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Rates"),
            Tab(text: "Statistics"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // 1st Tab
          Stack(
            children: [
              // bg
              Container(
                height: _height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/world_map.png'),
                  ),
                  color: Colors.indigoAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              // fg
              Container(
                height: _height,
                width: _width,
                alignment: Alignment.bottomCenter,
                child: FutureBuilder(
                    future: getCovidCaseData,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        CovidCase? covidCase = snapshot.data;

                        return (covidCase != null)
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: _height * 0.28),
                                      Text(
                                        "World Wide",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 42),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Total confirmed cases
                                          Column(
                                            children: [
                                              Text(
                                                "Confirmed",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalTotalConfirmed}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.lightBlue,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          // Total recovered cases
                                          Column(
                                            children: [
                                              Text(
                                                "Recovered",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalTotalRecovered}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.blueAccent,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          // Total deaths
                                          Column(
                                            children: [
                                              Text(
                                                "Deaths",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalTotalDeaths}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.redAccent,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 32),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Total confirmed cases
                                          Column(
                                            children: [
                                              Text(
                                                "New Confirmed",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalTotalNewConfirmed}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.lightBlue,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          // Total recovered cases
                                          Column(
                                            children: [
                                              Text(
                                                "New Recovered",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalNewRecovered}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.blueAccent,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          // Total deaths
                                          Column(
                                            children: [
                                              Text(
                                                "New Deaths",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Colors.grey),
                                              ),
                                              Text(
                                                "${covidCase.globalNewDeaths}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: Colors.redAccent,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 32),
                                      const Divider(
                                        thickness: 1.8,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text("No data found..."),
                              );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
          // 2nd Tab
          Stack(
            children: [
              // bg
              Container(
                height: _height * 0.25,
                decoration: const BoxDecoration(
                  color: Colors.indigoAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              // fg
              Container(
                height: _height,
                width: _width,
                child: FutureBuilder(
                    future: getCovidCaseData,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        CovidCase? covidCase = snapshot.data;

                        return (covidCase != null)
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: covidCase.countries.length,
                                itemBuilder: (context, i) {
                                  return Card(
                                    elevation: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${covidCase.countries[i].country}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              // Total confirmed cases
                                              Column(
                                                children: [
                                                  Text(
                                                    "Confirmed",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                  Text(
                                                    "${covidCase.countries[i].countryTotalConfirmed}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge
                                                        ?.copyWith(
                                                          color:
                                                              Colors.lightBlue,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              // vertical divider
                                              Container(
                                                height: 50,
                                                width: 2,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                ),
                                              ),
                                              // Total recovered cases
                                              Column(
                                                children: [
                                                  Text(
                                                    "Recovered",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                  Text(
                                                    "${covidCase.countries[i].countryTotalRecovered}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge
                                                        ?.copyWith(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              // vertical divider
                                              Container(
                                                height: 50,
                                                width: 2,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                ),
                                              ),
                                              // Total deaths
                                              Column(
                                                children: [
                                                  Text(
                                                    "Deaths",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                  Text(
                                                    "${covidCase.countries[i].countryTotalDeaths}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge
                                                        ?.copyWith(
                                                          color:
                                                              Colors.redAccent,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text("No data found..."),
                              );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
