import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:healthbud/info_dokter/model/info_dokter.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../tools/fetcherInfoDokter.dart';
import 'info_dokter_page.dart';

class ReviewDokterPage extends StatefulWidget {
  const ReviewDokterPage({Key? key, required this.infoDokter}) : super(key: key);
  final List<InfoDokter> infoDokter;
  @override
  State<ReviewDokterPage> createState() => _ReviewDokterPageState();
  
}

class _ReviewDokterPageState extends State<ReviewDokterPage> {
  final TextEditingController reviewController = TextEditingController();
  var request;
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    request= context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Review Dokter",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          leading: InkWell(
            onTap: ((){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>InfoDokterPage()));

            }),
            child: Icon(Icons.arrow_back,color: Colors.white,size:24)),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Pilih Dokter',
                        style: TextStyle(fontSize: 16)
                      ),
                      items: widget.infoDokter
                          .map((item) =>
                          DropdownMenuItem<int>(
                            value: item.pk,
                            child: Text(
                              item.fields!.namaDokter!,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonHeight: 40,
                      itemHeight: 40,
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      label: Text(
                          'Review',
                          style: TextStyle(fontSize: 14)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,

                  )
                ],
              ),
            )
        ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(bottom: 35,top:20,left: 27,right: 27 ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () async {
              if(selectedValue!=null && reviewController.text!=""){
                await FetcherInfoDokter().addReview(context,request,selectedValue.toString(),reviewController.text);
              }
            },
            child: Text(
              'Add Review',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
