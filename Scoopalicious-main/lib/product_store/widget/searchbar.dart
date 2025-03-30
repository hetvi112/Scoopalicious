import 'package:flutter/material.dart';
import 'package:storepro/themes/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key, required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow:[
             BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.search, color: Theme.of(context).iconTheme.color,),
              SizedBox(width: 8,),
              Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: Styles.searchText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  )
                ),
                IconButton(
                onPressed: () {
                  controller.clear();
                }, 
                icon: Icon(Icons.clear),
                ),
            ],
          ),
        ),
      ),
    );
  }
}