import 'package:exp_tracker/controller/homecontroller.dart';
import 'package:exp_tracker/view/addtransx/tranx.dart';
import 'package:flutter/material.dart';

class homescr extends StatefulWidget {
  const homescr({super.key});

  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
  @override
void initState(){
  fetchdata();
  super.initState();
}
fetchdata() async{
  await Homescrcontroller.getallData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: ()async{
      //   await Homescrcontroller.adddata();
      //   setState(() {
          
      //   });
      //   Homescrcontroller.getallData();
      //         setState(() {
                
      //         });
      // },
      // child: Icon(Icons.add),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> tranx() ));
      }),
     
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),color: Colors.black,),
      height: 350,
      width: double.infinity,
      
            ),
           Text("Recent Transactions"),
            Column(children: List.generate
            (Homescrcontroller.data.length, (index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(
                        child: Row(
                        
                          children: [ 
                          CircleAvatar(
                          child: Text(Homescrcontroller.trackerlist[index].type.toString()),
                        ),
                        Column(
                          children: [
                             Text(Homescrcontroller.trackerlist[index].category.toString()),
                           Text(Homescrcontroller.trackerlist[index].note.toString()),
                          ],
                        ),],),
                       ),
                        Column(
                          children: [
                  Text("\$${Homescrcontroller.trackerlist[index].amount.toString()}"),
                           Text(Homescrcontroller.trackerlist[index].date.toString()),
                                //              IconButton(onPressed: ()async{
                                //   await Homescrcontroller.deletedata(Homescrcontroller.trackerlist[index].id);
                                //   setState(() {
                    
                                //   });
                                // },
                                // icon: Icon(Icons.delete_forever),
                                // ),
                          ],
                        )
                        
                      ],
                    ),
                  
                  ),
                ),
            



            //  ListTile( 
            //   title: Text(Homescrcontroller.trackerlist[index].type.toString()),
            //   subtitle: Text(""),
            //   trailing: IconButton(onPressed: ()async{
            //     await Homescrcontroller.deletedata(Homescrcontroller.trackerlist[index].id);
            //     setState(() {
                  
            //     });
            //   },
            //   icon: Icon(Icons.delete_forever),
            //   ),
            // )
            ),)
          ],
        ),
      ),
    );
  }
}