import 'package:flutter/material.dart';
import 'package:healthbud/info_dokter/model/review_dokter.dart';
import '../model/info_dokter.dart';

class InfoDokterCard extends StatefulWidget {
  final InfoDokter infoDokter;
  final int index;
  final int lastIndex;
  final List<ReviewDokter> listReviewDokter;
  const InfoDokterCard({
    Key? key,
    required this.infoDokter,
    required this.index,
    required this.lastIndex,
    required this.listReviewDokter,
  }) : super(key: key);

  @override
  State<InfoDokterCard> createState() => _InfoDokterCardState();
}

class _InfoDokterCardState extends State<InfoDokterCard> {
  bool dropDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: widget.index % 2 == 0 ? Color(0xffc5d7f2) : Color(0xffcfe2ff)),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.infoDokter.fields!.namaDokter!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hari Praktek : ${widget.infoDokter.fields!.hariPraktek!}",
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Jadwal Praktek :${widget.infoDokter.fields!.jadwalPraktek!}",
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Review",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                IconButton(
                  icon: dropDown
                      ? Icon(Icons.arrow_drop_up)
                      : Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      if (dropDown) {
                        dropDown = false;
                      } else {
                        dropDown = true;
                      }
                    });
                  },
                ),
              ],
            ),
            Visibility(
              visible: dropDown ? true : false,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  maxHeight: 250.0,
                ),
                child: ListView.separated(
                  itemCount: widget.listReviewDokter.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                            widget.listReviewDokter[index].fields!.review!));
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
