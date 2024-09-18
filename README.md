
# Selectable Expandion Tile

A custom Flutter plugin for a selectable ExpansionTile with properties for a dynamic header, body, and ExpansionController, which ensures that expanding one tile collapses the others, providing a grouped behavior for multiple tiles. This allows for a synchronized accordion-style UI where only one tile remains expanded at any given time.

## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  selectable_expansion_tile: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:selectable_expansion_tile/selectable_expansion_tile.dart';
```

## Example
There properties which are required:

 - header
 - body   
 - onChanged [call back function with value when your tile is getting expanded or collapsed]               
 - controller [you can manually expand and collapse just by using controller.expand and controller.collapse.]

 other than that toggle fuction is there.

 For multiple Selectable expansion tile
 - value
 - group value 

 [when value and group value become same expansion tile gets expanded automatically and others gets collapsed]

<hr>

<table>
<tr>
<td>

```dart
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  ExpansionController controller = ExpansionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SelectableExpansionTile(
          controller: controller,
          header: Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
            ),
            child: RadioMenuButton(
              value: controller.value,
              groupValue: true,
              onChanged: (value) {
                if (controller.expanded == false) {
                  setState(() {
                    controller.expand();
                  });
                } else {
                  setState(() {
                    controller.collapse();
                  });
                }
              },
              child: const Text('Credit Card'),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            child: const Text(
              'Credit Card is the general term used to cover a wide range of credit transfers, including cash payments, giro-payments, and wire transfer to local banks. They are the most common form of cashless consumer payments in most countries within the European Union and Asia–Pacific (references: www.ecb.org and www.bis.org)',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
```

</td>
<td>
<img  src="https://raw.githubusercontent.com/kuntal-nandi/wapp/main/images/Screenshot_1726643800.png"  alt="">
</td>
</tr>
</table>

## Next Goals

 - [x] Add custom animation on expand and collapse.
 
 - [x] body widget more customisation.
 
 - [ ] Add more functionalities to the package.