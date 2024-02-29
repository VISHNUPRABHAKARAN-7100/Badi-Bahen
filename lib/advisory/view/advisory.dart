import 'package:badi_bahen/advisory/controller/advisory_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';

class Advisory extends StatelessWidget {
  const Advisory({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable to find the size of the device screen.
    final deviceScreenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        // AppBar
        _buildAppBar(),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/thank_you.svg',
                      semanticsLabel: '',
                    ),
                  ],
                ),
                const Text(
                  'Thank you',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: deviceScreenSize.width * 0.85,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff24B817),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 23),
                        children: [
                          TextSpan(
                            text: 'Thank you for always ',
                          ),
                          TextSpan(
                            text: 'stepping in to ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'and taking out your ',
                          ),
                          TextSpan(
                            text: 'precious time.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Consumer<AdvisoryController>(
                  builder: (context, snapShot, child) => Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: deviceScreenSize.width * 0.35,
                    height: deviceScreenSize.width * 0.25,
                    child: DottedBorder(
                      padding: const EdgeInsets.all(8),
                      borderType: BorderType.Rect,
                      radius: const Radius.circular(10),
                      dashPattern: const [6, 2],
                      strokeWidth: 2,
                      color: Colors.red,
                      child: Center(
                        child: SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${snapShot.timerData.months}',
                                    style: GoogleFonts.wallpoet(
                                      fontSize: 40,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const Text(
                                    'Month',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    ': ${snapShot.timerData.days}',
                                    style: GoogleFonts.wallpoet(
                                      color: Colors.red,
                                      fontSize: 40,
                                    ),
                                  ),
                                  const Text(
                                    'Days',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // AppBar widget.
  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back),
          const Text(
            "Advisory",
          ),
          Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Text(
                  "हिंदी",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
