# Flutter Radial Menu

[![pub package](https://img.shields.io/pub/v/radial_menu.svg)](https://pub.dartlang.org/packages/radial_menu)

A simple radial menu
[![Demo screenshot](https://github.com/OwnWeb/radial_menu/blob/master/statics/screenshot.png?raw=true)](https://github.com/OwnWeb/radial_menu/blob/master/statics/screenshot.png?raw=true)

## Usage

Add `radial_menu` to your pubspec:

```yaml
dependencies:
  radial_menu: any # or the latest version on Pub
```

Define your list of `RadialMenuEntry`: 

```dart 
List<RadialMenuEntry> radialMenuEntries = [
    RadialMenuEntry(icon: Icons.restaurant, text: 'Restaurant'),
    RadialMenuEntry(icon: Icons.hotel,text: 'Hotel'),
    RadialMenuEntry(icon: Icons.pool, text: 'Pool'),
    RadialMenuEntry(icon: Icons.shopping_cart, text: 'Shop'),
  ];
```

Then add it to your `RadialMenu`:

```dart
  Widget build(BuildContext context) {
    return RadialMenu(entries: radialMenuEntries,);
  }
```
