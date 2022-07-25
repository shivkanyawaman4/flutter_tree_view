import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:webplat/widgets.dart';

import 'const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(myData.first);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tree View'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: TreeView(nodes: [
            TreeNode(
                content: Widgets.nodeContainer(
                  totalAchievedIncome: myData['TotalAchievedIncome'],
                  totalExpectedIncome: myData['TotalExpectedIncome'],
                  packageAmount: myData['PackageAmount'] ?? 0,
                  size: size,
                  userName: myData['Username'],
                  name: myData['Name'],
                ),
                children: List.generate(
                  myData["Children"].length,
                  (index) {
                    List list = myData["Children"];
                    List list1 = myData["Children"][index]['Children'];

                    return TreeNode(
                        content: Widgets.nodeContainer(
                          totalAchievedIncome: list[index]
                              ['TotalAchievedIncome'],
                          totalExpectedIncome: list[index]
                              ['TotalExpectedIncome'],
                          packageAmount: list[index]['PackageAmount'] ?? 0,
                          size: size,
                          userName: list[index]['Username'],
                          name: list[index]['Name'],
                        ),
                        children: List.generate(list1.length, (inx) {
                          List list2 = myData["Children"][index]['Children']
                              [inx]['Children'];
                          return TreeNode(
                              content: Widgets.nodeContainer(
                                  totalAchievedIncome: list1[inx]
                                      ['TotalAchievedIncome'],
                                  totalExpectedIncome: list1[inx]
                                      ['TotalExpectedIncome'],
                                  packageAmount:
                                      list1[inx]['PackageAmount'] ?? 0,
                                  size: size,
                                  userName: list1[inx]['Username'],
                                  name: list1[inx]['Name']),
                              children: List.generate(list2.length, (inx1) {
                                List list3 = myData["Children"][index]
                                        ['Children'][inx]['Children'][inx1]
                                    ['Children'];
                                return TreeNode(
                                    content: Widgets.nodeContainer(
                                        totalAchievedIncome: list2[inx1]
                                            ['TotalAchievedIncome'],
                                        totalExpectedIncome: list2[inx1]
                                            ['TotalExpectedIncome'],
                                        packageAmount:
                                            list2[inx1]['PackageAmount'] ?? 0,
                                        size: size,
                                        userName: list2[inx1]['Username'],
                                        name: list2[inx1]['Name']),
                                    children:
                                        List.generate(list3.length, (inx2) {
                                      return TreeNode(
                                        content: Widgets.nodeContainer(
                                            totalAchievedIncome: list3[inx2]
                                                ['TotalAchievedIncome'],
                                            totalExpectedIncome: list3[inx2]
                                                ['TotalExpectedIncome'],
                                            packageAmount: list3[inx2]
                                                    ['PackageAmount'] ??
                                                0,
                                            size: size,
                                            userName: list3[inx2]['Username'],
                                            name: list3[inx2]['Name']),
                                      );
                                    }));
                              }));
                        }));
                  },
                )),
          ]),
        ),
      ),
    );
  }
}
