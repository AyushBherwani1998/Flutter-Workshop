import 'package:flutter_web/material.dart';

class Fav extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text("Favorite Quotes",style: TextStyle(color: Colors.black),),
      ),
      body: FavPage(),
    );
  }

}

class FavPage extends StatefulWidget{
  static var fav = new List();
  @override
  State<StatefulWidget> createState() {
    return FavHomePage();
  }
}

class FavHomePage extends State<FavPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: FavPage.fav.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,int index){
            return Card(
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              elevation: 10.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(20.0),
                title: Text(FavPage.fav[index].toString(),style: TextStyle(color: Colors.black,fontSize: 14.0,fontFamily: 'Oswald'),textAlign: TextAlign.justify,),
                trailing: IconButton(icon: Icon(Icons.delete,color: Colors.black,), onPressed: (){
                  removeQuote(FavPage.fav[index].toString());
                }),

              ),
            );
          }),
    );
  }

  void removeQuote(String string) {
    setState(() {
      FavPage.fav.remove(string);
    });
  }

}