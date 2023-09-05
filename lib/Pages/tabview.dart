import 'package:flutter/material.dart';

class TheTabs extends StatelessWidget {
  const TheTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Description"),
                Tab(text: "Company"),
                Tab(text: "Our works"),
              ],
              labelColor: Colors.black,
indicator: BoxDecoration(),
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black12),
              unselectedLabelStyle: TextStyle(color: Colors.black12,fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium."),
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Lorem epsum",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.")
                        ]),
                      ))
                    ],
                  ),
                    ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Company",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium."),
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Lorem epsum",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.")
                        ]),
                      ))
                    ],
                  ),
                    ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Our works",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium."),
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Lorem epsum",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.")
                        ]),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
