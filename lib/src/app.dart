import 'package:covid_statistics_app/src/screens/google_map_screen.dart';
import 'package:covid_statistics_app/src/screens/home_screen.dart';
import 'package:covid_statistics_app/src/screens/indian_country_screen.dart';
import 'package:covid_statistics_app/src/viewmodel/country_list_view_model.dart';
import 'package:covid_statistics_app/src/viewmodel/india_list_view_model.dart';
import 'package:covid_statistics_app/src/viewmodel/world_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndiaListViewModel(),
          child: IndiaCountry(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountryListViewModel(),
          child: HomeScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorldListViewModel(),
          child: GoogleMapWidget(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid statistics',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        // ChangeNotifierProvider(
        //   create: (context) => CountryListViewModel(),
        //   child: HomeScreen(),
      ),
    );
  }
}
