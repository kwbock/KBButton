#KBButton

KBButton is a subclass of NSButton. It was adapted from [http://github.com/mattlawer/BButton](http://github.com/mattlawer/BButton) to work under Cocoa on Mac OS X.

<img src="http://i.imgur.com/wURhe.png" />

Usage
-----
Start by dragging the KBButton folder into your XCode project.

1. Create a NSButton instance in interface builder.
2. Set the class of the NSButton to KBButton

### Changing the Color programatically ###

1. Connect NSButton to IBOutlet through interfacebuilder
2. call [[button cell] setKBButtonType:BButtonTypeDefault] in awakeFromNib. In the example this is done in KBAppDelegate.m

License
-------
This library is licensed under the [MIT license](https://github.com/kwbock/KBButton/blob/master/MIT-LICENSE).

Contributing
------------
If you would like to contribute or could improve the code, please submit a pull request or issue.