import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/forum/controllers/fetch.dart';
import 'package:healthbud/forum/views/widgets/post_field.dart';
import 'package:healthbud/forum/views/widgets/post_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forum'),
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        ),
        drawer: DrawerClass(parentScreen: ScreenName.Home),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              // crossAxisAlignment: ,
              children: [
                const SizedBox(
                  height: 20,
                ),
                PostFIeld(
                  hintText: "Tuliskan pertanyaan...",
                  controller: _postController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Post 💌'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Forum Posts',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder(future:fetchQuestion(),builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text("There is no question yet...",
                              style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20,
                              )),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => PostData(
                              title: snapshot.data![index].title,
                              user: snapshot.data![index].user,
                              detail: snapshot.data![index].detail,
                              addTime: snapshot.data![index].addTime));
                    }
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }
}
