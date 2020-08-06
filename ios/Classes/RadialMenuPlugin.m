#import "RadialMenuPlugin.h"
#if __has_include(<radial_menu/radial_menu-Swift.h>)
#import <radial_menu/radial_menu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "radial_menu-Swift.h"
#endif

@implementation RadialMenuPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRadialMenuPlugin registerWithRegistrar:registrar];
}
@end
