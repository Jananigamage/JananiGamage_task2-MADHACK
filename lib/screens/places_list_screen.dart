import 'package:flutter/material.dart';
import 'package:madhack2/models/places_model.dart';
import 'package:madhack2/providers/place_data_provider.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {
  // const PlacesListScreen({Key? key}) : super(key: key);

  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();

}


class PlacesListDescription extends StatefulWidget {
  // const PlacesListScreen({Key? key}) : super(key: key);

  @override
  _PlacesListDescriptionState createState() => _PlacesListDescriptionState();

}

class _PlacesListDescriptionState extends State<PlacesListDescription> {

  @override
  void initState() {
    super.initState();
    final mdl=Provider.of<PlaceDataProvider>(context,listen:false);
    mdl.loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDataProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: mdl.placeList.length,
            itemBuilder: (context, index) {
              PlaceModel place=mdl.placeList[index];
              return PlacesDescriptionCard(
                  name1: place.name,
                  image1:place.image,
                  des1:place.des
              );
            }));
  }

}

class PlacesDescriptionCard extends StatelessWidget {
  // const PlacesViewCard({Key? key}) : super(key: key);

  final String image1;
  final String name1;
  final String des1;

  PlacesDescriptionCard(
      {required this.image1, required this.name1, required this.des1});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20,
            ),

            Container(
                height: 200,
                width: 500,

                child: GestureDetector(

                    onTap: (){

                      Navigator.pop(context);

                    },

                    child: Center(

                        child: Hero(

                          tag:'imageHero',
                          child: Image.network(image1),

                        )


                    )

                  // child: Image.network(image),

                )


              // decoration: BoxDecoration(
              //     image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
              // ),

              // child: IconButton(
              //     icon: Icon(
              //       Icons.arrow_left_rounded,
              //
              //     ),
              //     onPressed: () {
              //
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => PlacesDescriptionCard(des1: des, image1: image, name1: name)),
              //       );
              //
              //     }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(54, 54, 54, 1)),

            ),
            SizedBox(
              height: 15,
            ),

            Text(des1, style: TextStyle(color: Color.fromRGBO(141, 144, 145, 1)),)
          ],
        ),
      ),
    );
  }
}




class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('back'),
        ),
      ),
    );
  }
}


















class _PlacesListScreenState extends State<PlacesListScreen> {

  @override
  void initState() {
    super.initState();
    final mdl=Provider.of<PlaceDataProvider>(context,listen:false);
    mdl.loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDataProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: mdl.placeList.length,
            itemBuilder: (context, index) {
              PlaceModel place=mdl.placeList[index];
              return PlacesViewCard(
                  name: place.name,
                  shortDetail: place.shortDetail,
                  image:place.image,
                  des:place.des

              );
            }));
  }
}

class PlacesViewCard extends StatelessWidget {
  // const PlacesViewCard({Key? key}) : super(key: key);

  final String image;
  final String name;
  final String shortDetail;
  final String des;

  PlacesViewCard(
      {required this.shortDetail, required this.image, required this.name, required this.des});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: 500,

                child: GestureDetector(

                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (_){

                        return PlacesDescriptionCard(des1: des, image1: image, name1: name);

                      }));

                    },

                    child: Hero(

                      tag:'imageHero',
                      child: Image.network(image),

                    )



                )


              // decoration: BoxDecoration(
              //     image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
              // ),

              // child: IconButton(
              //     icon: Icon(
              //       Icons.arrow_left_rounded,
              //
              //     ),
              //     onPressed: () {
              //
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => PlacesDescriptionCard(des1: des, image1: image, name1: name)),
              //       );
              //
              //     }),
            ),


            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(54, 54, 54, 1)),

            ),
            SizedBox(
              height: 15,
            ),

            Text(shortDetail, style: TextStyle(color: Color.fromRGBO(141, 144, 145, 1)),)
          ],
        ),
      ),
    );
  }
}



