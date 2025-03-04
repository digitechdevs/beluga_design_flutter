import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.backgroundColor = Colors.white,
    this.indicatorColor = const Color(0xff9747FF),
    this.labelColor = Colors.white,
    this.unselectedLabelColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  tabs: tabs,
                  // indicatorPadding: E
                  indicatorSize: TabBarIndicatorSize.tab,
                  // indicatorColor: indicatorColor,
                  indicator: BoxDecoration(
                    color: indicatorColor, // Background color of the indicator
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  labelColor: labelColor,
                  unselectedLabelColor: unselectedLabelColor,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: tabViews,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class CustomTabBar extends StatefulWidget {
//   final List<Map<String, dynamic>> tabs;
//   final Color selectedColor;
//   final Color unselectedColor;
//   final Color badgeSelectedColor;
//   final Color badgeUnselectedColor;
//   final Function(int)? onTabSelected;

//   const CustomTabBar({
//     Key? key,
//     required this.tabs,
//     this.selectedColor = Colors.purple,
//     this.unselectedColor = Colors.transparent,
//     this.badgeSelectedColor = Colors.red,
//     this.badgeUnselectedColor = Colors.grey,
//     this.onTabSelected,
//   }) : super(key: key);

//   @override
//   _CustomTabBarState createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(6.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 5,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(widget.tabs.length, (index) {
//             bool isSelected = selectedIndex == index;
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//                 if (widget.onTabSelected != null) {
//                   widget.onTabSelected!(index);
//                 }
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 decoration: BoxDecoration(
//                   color: isSelected ? widget.selectedColor : widget.unselectedColor,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       widget.tabs[index]['title'],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black87,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: isSelected ? widget.badgeSelectedColor : widget.badgeUnselectedColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Text(
//                         widget.tabs[index]['count'].toString(),
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }