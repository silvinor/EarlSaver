// EarlSaverView.h

#import <ScreenSaver/ScreenSaver.h>
#import <WebKit/WebKit.h>

@interface EarlSaverView : ScreenSaverView

// Properties
@property (nonatomic, strong) WKWebView *webView;   // Web view to display the website
@property (nonatomic, strong) NSString *urlString;  // URL string loaded from config.json

// Methods
- (void)loadConfigAndStartWebView;  // Method to load config file and start WebView

@end
