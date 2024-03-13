import 'package:flutter/material.dart';
import 'package:rmk_note/src/config/app_colors.dart';
import 'package:rmk_note/src/screen/ui_note.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.searchColor,
          hintText: 'Search by the keyword...',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.only(left: 30.0),
          suffixIcon: IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoteScreen()));
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
