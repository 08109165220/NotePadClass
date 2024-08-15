import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notepad_sql/Note_Respository.dart';

import 'HomePage.dart';
import 'bottom_nav/Notes.dart';
import 'models/notess.dart';

class Notesinput extends StatefulWidget {
   Notesinput({super.key, this.notess});
   final Notess? notess;
  @override
  State<Notesinput> createState() => _NotesinputState();
}

class _NotesinputState extends State<Notesinput> {
  final _categories = TextEditingController();

  final _title = TextEditingController();
@override
  void initState() {
    if(widget.notess!=null){
      _title.text=widget.notess!.title;
      _categories.text=widget.notess!.categories;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Homepage()));
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          widget.notess==null?
          IconButton(
              onPressed: () {
         showDialog(context: context, builder: (context) => AlertDialog(
           content: const Text("Are you sure you want to delete this note"),
           actions: [
             TextButton(onPressed: () {
               Navigator.pop(context);
             }, child: Text("No")),
             TextButton(
                 onPressed: () {
               Navigator.pop(context);
               _deleteNotes();
               setState(() {

               });
             }, child: Text("Yes")),

           ],
         ),);
              }, icon: Icon(Icons.delete)):const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                if(widget.notess==null){
                  return  _insertNotes();
                }else{
                  _updateNotes();
                }

                // String title = _titleController.text;
                // String note = _notesController.text;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Homepage()));
                setState(() {

                });
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              controller: _title,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                controller: _categories,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Write your note here',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _insertNotes()async{
    final notess=Notess(
        title: _title.text,
        categories: _categories.text,
        createdAt: DateTime.now(),
    );
   await NoteRespository.insert(notess: notess);
  }
  _updateNotes()async{
    final notess=Notess(
      id: widget.notess!.id,
        title: _title.text,
        categories: _categories.text,
        createdAt: widget.notess!.createdAt,
    );
   await NoteRespository.update(notess: notess);
  }
  _deleteNotes()async{
     NoteRespository.delete(notess: widget.notess!);

    Navigator.pop(context);
  }
}
