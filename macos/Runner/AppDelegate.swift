import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {

    private var channel: FlutterMethodChannel?

    
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    override func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        if let flutterController = NSApp.windows.first?.contentViewController as? FlutterViewController {
            channel = FlutterMethodChannel(name: "com.example.app/sleep", binaryMessenger: flutterController.engine.binaryMessenger)
        }

        NSWorkspace.shared.notificationCenter.addObserver(self,
                                                          selector: #selector(didSleep),
                                                          name: NSWorkspace.screensDidSleepNotification,
                                                          object: nil)
        
        let dnc = DistributedNotificationCenter.default()


        dnc.addObserver(forName: .init("com.apple.screenIsLocked"),
                                       object: nil, queue: .main) { _ in
            NSLog("Screen Locked")
            self.channel?.invokeMethod("didSleep", arguments: nil)
        }


        
    }
    
    @objc func didSleep(notification: NSNotification) {
        print("sleep")
        channel?.invokeMethod("didSleep", arguments: nil)
    }
}
