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
    self.webView = [[WKWebView alloc] initWithFrame:self.bounds];
    self.webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self addSubview:self.webView];
}

// Load the URL from config.json, or fallback to default.html
- (void)loadConfigAndStartWebView {
    // Get the path of the config.json file from the bundle
    NSString *configPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"config" ofType:@"json"];
    
    // Try to load the JSON data
    NSData *data = [NSData dataWithContentsOfFile:configPath];
    BOOL shouldLoadURL = NO;
    
    if (data) {
        NSError *error = nil;
        NSDictionary *config = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error) {
            NSLog(@"Error parsing config.json: %@", error);
        } else {
            // Extract the URL from the config
            self.urlString = config[@"url"];
            if (self.urlString && [self isValidURL:self.urlString]) {
                shouldLoadURL = YES;
            }
        }
    } else {
        NSLog(@"config.json file not found.");
    }
    
    if (shouldLoadURL) {
        // Load the URL from the config file
        NSURL *url = [NSURL URLWithString:self.urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    } else {
        // Fallback to loading default.html from the Resources folder
        [self loadLocalHTML];
    }
}

// Validate if the string is a valid URL
- (BOOL)isValidURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    return (url && url.scheme && url.host);
}

// Load default.html from the Resources folder
- (void)loadLocalHTML {
    NSString *htmlPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"default" ofType:@"html"];
    if (htmlPath) {
        NSURL *htmlURL = [NSURL fileURLWithPath:htmlPath];
        [self.webView loadFileURL:htmlURL allowingReadAccessToURL:[htmlURL URLByDeletingLastPathComponent]];
    } else {
        NSLog(@"default.html not found in Resources folder.");
    }
}

@end
