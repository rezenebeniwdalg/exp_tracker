import 'package:exp_tracker/controller/homecontroller.dart';
import 'package:exp_tracker/view/home/homescr.dart';
import 'package:flutter/material.dart';

class tranx extends StatefulWidget {
  const tranx({super.key});

  @override
  State<tranx> createState() => _tranxState();
}

class _tranxState extends State<tranx> {
  TextEditingController _amount = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _note = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()async {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>homescr()));
            
          },
          child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          TextField(
            controller: _amount,decoration: InputDecoration(hintText: "amount"),
          ),
        SizedBox(height: 20,),
          TextField(
            controller: _category
            ,
          ),
           SizedBox(height: 20,),
          TextField(
            controller: _type,
          ),
           SizedBox(height: 20,),
          TextField(controller: _date,),
           SizedBox(height: 20,),
          TextField(controller: _note,),
           SizedBox(height: 20,),
           InkWell(
            onTap: ()async {
               await Homescrcontroller.adddata(
                amount: _amount.text,
                category: _category.text,
                type: _type.text,
                date: _date.text,
                note: _note.text,
               );
               setState(() {
                 
               });
               Homescrcontroller.getallData();
               setState(() {
                 
               });
            },
             child: Container(
              child: Text("Add Transaction"),
             ),
           )
        ],
        ),
      ),



    );
  }
}