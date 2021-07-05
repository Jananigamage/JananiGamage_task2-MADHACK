import 'package:madhack2/providers/place_data_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madhack2/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(TravelApp());
}

class TravelApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: providers,
      child: MaterialApp(

        title: "Travel App",
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.blue)
        ),
        home: PlacesListScreen(),
      ),

    );

  }


}

List<SingleChildWidget> providers=[

  ChangeNotifierProvider<PlaceDataProvider>(create: (_)=> PlaceDataProvider())

];

