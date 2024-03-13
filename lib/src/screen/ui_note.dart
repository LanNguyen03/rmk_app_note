import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rmk_note/src/config/app_colors.dart';
import 'package:rmk_note/src/config/app_paragraph.dart';
import 'package:rmk_note/src/resource/model/note_model.dart';
import 'package:rmk_note/src/screen/UI_editor/editor_screen.dart';
import 'package:rmk_note/src/screen/ui_note/components/item_widget.dart';
import 'package:rmk_note/src/screen/ui_search.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<NoteMode> listNote = [];
  List<Color> colors = [
    AppColors.colorPink,
    AppColors.colorRed,
    AppColors.colorgreen,
    AppColors.colorYellow,
    AppColors.colorBlue,
    AppColors.colorPurple,
  ];
  ScrollController scrollController = ScrollController();
  int currentMax = 10;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _handleInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
  }

  void _handleInit() {
    listNote.addAll([
      NoteMode(
          title: '1', content: 'UI concepts worth exsisting', createAt: ''),
      NoteMode(
          title: '1',
          content: 'Book Review : The Design of Everyday Things by Don Norman'),
      NoteMode(title: '1', content: 'Animes produced by Ufotable'),
      NoteMode(title: '1', content: 'Mangas planned to read'),
      NoteMode(title: '1', content: 'Awesome tweets collection'),
      NoteMode(title: '1', content: 'List of free & open source apps'),
      NoteMode(
          title: '1', content: 'UI concepts worth exsisting', createAt: ''),
      NoteMode(
          title: '1',
          content: 'Book Review : The Design of Everyday Things by Don Norman'),
      NoteMode(title: '1', content: 'Animes produced by Ufotable'),
      NoteMode(title: '1', content: 'Mangas planned to read'),
    ]);
  }

  getMoreData() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    listNote.addAll(
      [
        NoteMode(title: '1', content: 'aaaaaa'),
        NoteMode(title: '1', content: 'bbbbbbbbb'),
        NoteMode(title: '1', content: 'cccccccc')
      ],
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgtColor,
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 3, 2, 2),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditorScreen()));
          }),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Paragraph(
                  content: 'Notes',
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.2)),
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.2)),
                  height: 50,
                  width: 50,
                  child: const Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              listNote.clear();
              _handleInit();
            },
            child: ListView.builder(
                controller: scrollController,
                itemCount: listNote.length + 1,
                itemBuilder: ((context, index) {
                  if (index == listNote.length) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  final note = listNote[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) => _NoteScreenState(),
                        )
                      ],
                    ),
                    child: ItemWidget(
                      color: colors[index % colors.length],
                      content: note.content,
                    ),
                  );
                })),
          ))
        ]),
      ),
    );
  }
}
