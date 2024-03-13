import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:rmk_note/src/config/app_colors.dart';
import 'package:rmk_note/src/config/app_space.dart';
import 'package:rmk_note/src/screen/UI_editor/components/alert_dialog_widget.dart';
import 'package:rmk_note/src/screen/UI_editor/components/custom_button_widget.dart';
import 'package:rmk_note/src/screen/UI_editor/components/input_form_widget.dart';
import 'package:rmk_note/src/screen/ui_note.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  // QuillController controller = QuillController.basic();
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SpaceBox.sizeMedium),
          child: Column(
            children: [
              headerWidget(context),
              SizedBox(
                height: SpaceBox.sizeBig,
              ),
              bodyWidget(),
            ],
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   children: [
      //     Flexible(
      //       child: QuillToolbar.simple(
      //           configurations: QuillSimpleToolbarConfigurations(
      //         controller: controller,
      //         sharedConfigurations: const QuillSharedConfigurations(
      //           locale: Locale('de'),
      //         ),
      //         multiRowsDisplay: false,
      //       )),
      //     ),
      //   ],
      // ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          iconData: Icons.chevron_left,
          iconColor: AppColors.colorWhite,
          iconSize: Size.sizeMedium1,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoteScreen()));
          },
        ),
        const Spacer(),
        CustomIconButton(
          iconData: Icons.remove_red_eye,
          iconColor: AppColors.colorWhite,
          iconSize: Size.sizeSmall2,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (param) {
                return AlertDialog(
                  backgroundColor: AppColors.bgrColors,
                  title: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: SpaceBox.sizeLarge),
                        child: const Icon(
                          Icons.warning_outlined,
                          color: AppColors.colorGreyShadow,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Are your sure you want discard your changes ?',
                        style: TextStyle(
                          fontSize: Size.sizeSmall2,
                          color: AppColors.colorGreyShadow,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAlertDialogButton(
                          text: 'Discard',
                          color: AppColors.colorRed,
                          onPressed: () {
                            // Your Discard logic here
                            Navigator.pop(context);
                          },
                        ),
                        CustomAlertDialogButton(
                          text: 'Keep',
                          color: AppColors.colorGreen,
                          onPressed: () {
                            // Your Save logic here
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        SizedBox(width: SpaceBox.sizeMedium),
        CustomIconButton(
          iconData: Icons.save,
          iconColor: AppColors.colorWhite,
          iconSize: Size.sizeSmall2,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (param) {
                return AlertDialog(
                  backgroundColor: AppColors.bgrColors,
                  title: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: SpaceBox.sizeLarge),
                        child: const Icon(
                          Icons.warning_outlined,
                          color: AppColors.colorGreyShadow,
                        ),
                      ),
                      Text(
                        'Save Changes ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Size.sizeSmall2,
                          color: AppColors.colorGreyShadow,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAlertDialogButton(
                          text: 'Discard',
                          color: AppColors.colorRed,
                          onPressed: () {
                            // Your Discard logic here
                            Navigator.pop(context);
                          },
                        ),
                        CustomAlertDialogButton(
                          text: 'Save',
                          color: AppColors.colorGreen,
                          onPressed: () {
                            // Your Save logic here
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget bodyWidget() {
    return Expanded(
      child: Column(
        children: [
          CustomInputForm(
            textEditingController: myController,
            numberMaxLine: 4,
            numberMinLine: 1,
            hintText: 'Title',
            fontSize: FontSize.sizeLarge,
            hintColor: AppColors.colorGrey1,
          ),
          CustomInputForm(
            numberMaxLine: null,
            numberMinLine: 1,
            hintText: 'Type something...',
            fontSize: FontSize.sizeMedium,
            hintColor: AppColors.colorGrey1,
          ),
        ],
      ),
    );
  }
}
