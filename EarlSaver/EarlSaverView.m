// EarlSaverView.m

#import "EarlSaverView.h"

@implementation EarlSaverView

// Initialize the screen saver view
- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setUpWebView];
        [self loadConfigAndStartWebView];
    }
    return self;
}

// Set up WKWebView
- (void)setUpWebView {
    // Create a web view with the frame of the screen saver
    self.webView = [[WKWebView alloc] initWithFrame:self.bounds];
    self.webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;

    // Add the web view to the screen saver view
    [self addSubview:self.webView];
}

// Load URL from config.json and start the WebView
- (void)loadConfigAndStartWebView {
    // Get the path of the config.json file from the app's bundle
    NSString *configPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"config" ofType:@"json"];
    
    // Read the contents of the file
    NSData *data = [NSData dataWithContentsOfFile:configPath];
    if (data) {
        NSError *error = nil;
        NSDictionary *config = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error) {
            NSLog(@"Error parsing config.json: %@", error);
        } else {
            // Extract the URL string from the config
            self.urlString = config[@"url"];
            if (self.urlString) {
                // Load the website in the WKWebView
                NSURL *url = [NSURL URLWithString:self.urlString];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                [self.webView loadRequest:request];
            } else {
                NSLog(@"No URL found in config.json");
            }
        }
    } else {
        NSLog(@"config.json file not found");
    }
}

// Override the animateOneFrame method to keep the screensaver active
- (void)animateOneFrame {
    // No special animation logic, but required by ScreenSaverView
    [super animateOneFrame];
}

@end
