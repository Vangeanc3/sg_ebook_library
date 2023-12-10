import 'package:flutter/material.dart';
import 'package:grimorio/controllers/share_book_controller.dart';
import 'package:grimorio/controllers/user_controller.dart';
import 'package:grimorio/models/user.dart';
import 'package:grimorio/screens/previa_web.dart';

import '../controllers/book_controller.dart';
import '../models/personal_book.dart';
import '../theme.dart';
import 'components/display_text.dart';
import 'components/primary_button.dart';
import 'components/secondary_button.dart';
import 'edit_details.dart';
import 'home.dart';

// ignore: must_be_immutable
class BookDetails extends StatefulWidget {
  PersonalBook book;
  BookDetails({super.key, required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final BookController bookController = BookController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: DisplayText("Detalhes do Livro"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Image.network(
                      widget.book.googleBook.thumbnailLink,
                      height: 220,
                      width: 144,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      widget.book.googleBook.title,
                      style: ModalDecorationProperties.bookTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        widget.book.googleBook.authors,
                        style: ModalDecorationProperties.bookAuthor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.book.googleBook.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Inicio da Leitura",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(children: <Widget>[
                      Text(
                        widget.book.dayStarted,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.mediumPink,
                          ),
                        ),
                        Text(
                          "Final da Leitura",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(children: <Widget>[
                      Text(
                        widget.book.dayFinished,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Comentários",
                          style: TextStyle(color: AppColors.mediumPink),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(widget.book.comments)),
                      ],
                    ),
                  ),
                  PrimaryButtonIcon(
                    icon: Icons.remove_red_eye,
                    text: "Ver Prévia",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviaWeb(
                                    link: widget.book.googleBook.previewLink,
                                  ))).then((value) {
                        setState(() {
                          if (value != null) {
                            widget.book = value;
                          }
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  PrimaryButtonIcon(
                    icon: Icons.edit,
                    text: "Editar",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditDetails(
                                    book: widget.book,
                                  ))).then((value) {
                        setState(() {
                          if (value != null) {
                            widget.book = value;
                          }
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  SecondaryButton(
                    icon: Icons.delete,
                    text: "Excluir",
                    onTap: () {
                      bookController.removeBook(widget.book);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (_) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  SecondaryButton(
                    icon: Icons.share,
                    text: "Compartilhar",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: const EdgeInsets.all(16),
                          clipBehavior: Clip.hardEdge,
                          shape: ModalDecorationProperties.modalBorder,
                          child: Container(
                            padding: const EdgeInsets.all(32.0),
                            decoration: ModalDecorationProperties.boxDecoration,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        InkWell(
                                          child: const Icon(Icons.close),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  const DisplayText("Compartilhar"),
                                  const SizedBox(height: 24),
                                  _UsersList(
                                      book: widget.book,
                                      future: UserController().getUsers()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UsersList extends StatefulWidget {
  final Future<List<User>> future;
  final PersonalBook book;
  const _UsersList({required this.future, required this.book});

  @override
  State<_UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<_UsersList> {
  List<User> multipleSelected = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return const SizedBox(
                child: Center(child: CircularProgressIndicator()),
              );

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if (snapshot.hasData || snapshot.data != []) {
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          snapshot.data![index].name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        value: multipleSelected.contains(snapshot.data![index]),
                        onChanged: (value) {
                          setState(() {
                            if (multipleSelected
                                .contains(snapshot.data![index])) {
                              multipleSelected.remove(snapshot.data![index]);
                            } else {
                              multipleSelected.add(snapshot.data![index]);
                            }
                          });
                        },
                      ),
                      itemCount: snapshot.data!.length,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                        text: "Compartilhar",
                        onTap: () {
                          for (var u in multipleSelected) {
                            ShareBookController()
                                .addSharedBook(u.id, widget.book)
                                .then((value) => Navigator.pop(context));
                          }
                        })
                  ],
                );
              }
          }
          return const SizedBox();
        });
  }
}
