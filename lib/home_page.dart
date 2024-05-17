import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,


      appBar: AppBar(
        title: const Text("Home"),
      ),

      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context,index) {
            return _listItem(index);
          }
      ),

    );
  }

  Widget _listItem (int index){
    return InkWell(
      onTap: (){
        SnackBar snackBar = SnackBar(content: Text("User clicked on ${index+1}"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Text(
            "List Index is ${index + 1}"
        ),
      ),
    );
  }

}
