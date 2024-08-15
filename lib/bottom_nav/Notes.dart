import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notepad_sql/Note_Respository.dart';

import '../NotesInput.dart';
import '../models/notess.dart';


class Notes extends StatefulWidget {

  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.black.withOpacity(0.8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'All Notes',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade700),
                    color: Colors.grey.shade900,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: Colors.grey
                            ),
                            controller: _searchcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Search Notes',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child:
               FutureBuilder(
                   future: NoteRespository.getNotes(),
                   builder: (context, snapshot) {
                     if(snapshot.connectionState==ConnectionState.done){
                       if(snapshot.data==null || snapshot.data!.isEmpty){
                         return const Center(child: Text("Empty"),);
                       }
                       return  ListView(
                         padding: const EdgeInsets.all(15),
                         children: [
                           for(var notess in snapshot.data!)
                              NoteContainer(notess: notess,)
                         ],
                       );
                     }
                     return const SizedBox();
                   },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteContainer extends StatelessWidget {
  final Notess notess;
  const NoteContainer({
    super.key, required this.notess,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {

        // IconButton(
        //     onPressed: () {
        //       showDialog(context: context, builder: (context) => AlertDialog(
        //         content: const Text("Are you sure you want to delete this note"),
        //         actions: [
        //           TextButton(onPressed: () {
        //             Navigator.pop(context);
        //           }, child: Text("No")),
        //           TextButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //                 _deleteNotes();
        //                 setState(() {
        //
        //                 });
        //               }, child: Text("Yes")),
        //
        //         ],
        //       ),);
        //     }, icon: Icon(Icons.delete)):const SizedBox();
      },
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Notesinput(notess: notess,) ,));
        },
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notess.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                         DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(notess.createdAt),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          DateFormat(DateFormat.HOUR24_MINUTE_SECOND).format(notess.createdAt),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          size: 12,
                          color: Colors.grey,
                        ),
                        Text(
                          ' ' + notess.categories,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
