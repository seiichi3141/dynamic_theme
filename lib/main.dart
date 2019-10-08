import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _primarySwatch = Colors.blue;
  var _isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Widget',
      theme: ThemeData(
        primarySwatch: _primarySwatch,
        brightness: _isDark ? Brightness.dark : Brightness.light,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: _buildAppBar(),
            floatingActionButton: _buildFab(),
            body: _buildStyleList(context),
            bottomNavigationBar: _buildSettings(context),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      title: const Text('Dynamic Theme'),
      actions: [
        IconButton(
          icon: Icon(Icons.undo),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.redo),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      child: const Icon(Icons.add_alert),
      onPressed: () {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: const Text('Pressed FAB'),
          action: SnackBarAction(
            label: '非表示',
            onPressed: _scaffoldKey.currentState.hideCurrentSnackBar
          ),
        ));
      },
    );
  }

  Widget _buildStyleList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        RaisedButton(child: const Text('Raised Button'), onPressed: () {}),
        FlatButton(child: const Text('Flat Button'), onPressed: () {}),
        const Divider(),
        Text('Display 4', style: textTheme.display4),
        Text('Display 3', style: textTheme.display3),
        Text('Display 2', style: textTheme.display2),
        Text('Display 1', style: textTheme.display1),
        Text('Headline', style: textTheme.headline),
        Text('Title', style: textTheme.title),
        Text('Subhead', style: textTheme.subhead),
        Text('Body 2', style: textTheme.body2),
        Text('Body 1', style: textTheme.body1),
        Text('caption', style: textTheme.caption),
        Text('button', style: textTheme.button),
        Text('subtitle', style: textTheme.subtitle),
        Text('overline', style: textTheme.overline),
      ],
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Material(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text('Primary Swatch'),
                const SizedBox(width: 16),
                Expanded(child: SizedBox(height: 56, child: _buildColors()))
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Expanded(child: Text('Dark theme')),
                Switch(
                  value: _isDark,
                  onChanged: (value) => setState(() {
                    _isDark = value;
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColors() {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Colors.primaries.length,
        itemBuilder: (_, index) {
          return Material(
            color: Colors.primaries[index][500],
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(4),
                width: 56,
                color: Colors.transparent,
                child: _primarySwatch == Colors.primaries[index]
                    ? Icon(Icons.check, color: Colors.white)
                    : null,
              ),
              onTap: () {
                setState(() {
                  _primarySwatch = Colors.primaries[index];
                });
              },
            ),
          );
        },
      ),
    );
  }
}
