import 'package:dreams_sample/bloc/add_note_bloc.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:dreams_sample/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Note အသစ်ထည့်ရင် ပြပေးမယ့် widget class
class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddNoteBloc>(
      create: (_) => AddNoteBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Note'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(kSP10x),
            child: SingleChildScrollView(
              child: Column(
                spacing: kSP10x,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Add Note TextField View
                  Builder(builder: (context) {
                    final bloc = context.read<AddNoteBloc>();
                    return TextFieldWidget(
                      isAddValidator: true,
                      hintText: kWriteYourNoteText,
                      prefixIcon: Icons.note_add,
                      onChanged: (userNote) {
                        bloc.setUserNote(userNote);
                      },
                    );
                  }),

                  ///Add Button View
                  MaterialButton(
                    minWidth: double.infinity,
                    height: kAddButtonHeight,
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      final bloc = context.read<AddNoteBloc>();
                      bloc.onTapAdd();
                    },
                    child: Text(kAddNoteButtonText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
