import 'package:flutter/material.dart';
import 'package:koofit/diet/tab_menu.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class AddDietScreen extends StatefulWidget {

  @override
  State<AddDietScreen> createState() => _AddDietScreenState();
}

class _AddDietScreenState extends State<AddDietScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  String searchValue = '';
  final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:  Scaffold(
          appBar: EasySearchBar(
              title: const Text('Example'),
              onSearch: (value) => setState(() => searchValue = value),
              suggestions: _suggestions
          ),
          drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                        title: const Text('Item 1'),
                        onTap: () => Navigator.pop(context)
                    ),
                    ListTile(
                        title: const Text('Item 2'),
                        onTap: () => Navigator.pop(context)
                    )
                  ]
              )
          ),
          body: Center(
              child:
              TabMenu()

          )
      )

      );

  }

  Widget searchBar() {
    return Scaffold(
        appBar: EasySearchBar(
            title: const Text('음식명으로 검색'),
            backgroundColor: Colors.transparent,

            onSearch: (value) => setState(() => searchValue = value),
            suggestions: _suggestions
        ),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                      title: const Text('Item 1'),
                      onTap: () => Navigator.pop(context)
                  ),
                  ListTile(
                      title: const Text('Item 2'),
                      onTap: () => Navigator.pop(context)
                  )
                ]
            )
        ),
        body: Center(
            child: Text('Value: $searchValue')
        )
    );
  }

}