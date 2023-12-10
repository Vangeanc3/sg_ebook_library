import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/controllers/share_book_controller.dart';
import 'package:grimorio/models/personal_book.dart';
import 'package:grimorio/screens/book_details.dart';
import 'package:grimorio/screens/components/display_text.dart';
import 'package:grimorio/theme.dart';

class ShareBooks extends StatelessWidget {
  const ShareBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final shareBookController = ShareBookController();

    return Center(
      child: FutureBuilder(
        future: shareBookController.getSharedBooks(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return _FilledHome(listPersonalBook: snapshot.data!);
              }
              break;
            default:
              break;
          }
          return const _EmptyHome();
        },
      ),
    );
  }
}

class _FilledHome extends StatefulWidget {
  _FilledHome({required this.listPersonalBook});

  List<PersonalBook> listPersonalBook;

  @override
  State<_FilledHome> createState() => _FilledHomeState();
}

class _FilledHomeState extends State<_FilledHome> {
  final shareBookController = ShareBookController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 8.0),
                  child: DisplayText("Livros"),
                ),
              ),
              SliverGrid.builder(
                itemCount: widget.listPersonalBook.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 167,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(
                          book: widget.listPersonalBook[index],
                        ),
                      ),
                    ).then((value) async {
                      widget.listPersonalBook =
                          await shareBookController.getSharedBooks();
                      // setState(() { });
                    });
                  },
                  child: Image.network(
                    widget.listPersonalBook[index].googleBook.thumbnailLink,
                    height: 220,
                    width: 144,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 72,
            width: MediaQuery.of(context).size.width,
            decoration: HomeShadowProperties.boxDecoration,
          ),
        ),
      ],
    );
  }
}

class _EmptyHome extends StatelessWidget {
  const _EmptyHome();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: DisplayText("Compartilhados"),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: SvgPicture.asset("assets/images/grimorio_empty.svg"),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Sem livros compartilhados!",
          style: TextStyle(
              fontFamily: "Bigelow Rules",
              fontSize: 36,
              color: AppColors.darkPurple),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 40.0),
        child: Text(
          "Ninguém Compartilhou livros com você",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    ]);
  }
}
