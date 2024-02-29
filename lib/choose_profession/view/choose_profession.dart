import 'package:flutter/material.dart';
import '../model/choose_profession_model.dart';

class ChooseProfession extends StatelessWidget {
  const ChooseProfession({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable to find the size of the device screen.
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        // AppBar
        _buildAppBar(),

        // Grid view for show the cards.
        _chooseProfessionGrid(screenSize, context),
      ],
    );
  }

  // GrideView to show the cards of the professional types.
  Expanded _chooseProfessionGrid(Size screenSize, BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Choose Your Profession?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GridView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: List.generate(
                        category.length,
                        (index) => _professionCard(
                          screenSize: screenSize,
                          context: context,
                          categoryName: category[index].categoryName,
                          iconData: category[index].iconData,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AppBar widget.
  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Create Account",
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

  // The below container is for showing all the professional cards.
  Container _professionCard({
    required Size screenSize,
    required BuildContext context,
    required IconData iconData,
    required String categoryName,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Below material widget is used for give the elevation.
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 5,
            shadowColor: Colors.black,

            // Outer circle.
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: screenSize.width * 0.05,

              // Inner circle.
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: screenSize.width * 0.045,
                child: Icon(
                  iconData,
                  size: screenSize.width * 0.05,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenSize.width * 0.025,
            ),
          )
        ],
      ),
    );
  }
}

// List for storing the profession type.
List<ProfessionCategory> category = [
  ProfessionCategory(
      iconData: Icons.person, categoryName: "Self Employed Business"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Professionals"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Pensioners"),
  ProfessionCategory(iconData: Icons.person, categoryName: "General Workforce"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Digital Workforce"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Shopkeepers"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Government Jobs"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Private Jobs"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Corporate Jobs"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Content Creator"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Freelancers"),
  ProfessionCategory(
      iconData: Icons.person, categoryName: "Startup Entrepreneurs"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Students"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Homemaker"),
  ProfessionCategory(iconData: Icons.person, categoryName: "Unemployed"),
];
