import 'package:flutter/material.dart';

///Note အသစ်ထည့်ရင် ပြပေးမယ့် widget class
class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Add Note TextField View
                TextFormField(
                  maxLines: null,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your note',
                    prefixIcon: Icon(Icons.note_add),
                  ),
                ),

                ///Add Button View
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
