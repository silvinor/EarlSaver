# Earl Saver

> Ummm... a play on words with reminiscences of the TV show, "My Name Is Earl" - it's supposed to be called URL Saver

This project is a custom macOS screen saver that displays a web URL.  Use it to display your corporate marketing animation or a clock ... whatever.  Note, it is ***<u>not</u>*** interactive - since once you move your mouse the saver will terminate - keep that in mind.

## Features

- A **URL**: Point to a URL.  That's it.

## Configuration

The screen saver can be configured by modifying the `config.json` file. Here's an example of what you can customize:

```json
{
  "url": "https://yourcompany.yourdomain/yourmarketingslidedeck"
}
```

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.  *(It would have been the Unlicence / public domain, but that carries the burden of Liability and Warranty.)*

## Acknowledgment

The `v0.1` code was entirely written by ChatGPT, an AI developed by OpenAI, with guidance and project input from me. *(On a 2013 **iMac**, running **MacOS Catalina** 10.15.7 and **Xcode** 12.4.)*

What's fascinating on this one is that it got it right on the first try, with no modifications!  The prompt I used was:

```txt
Hello.  Today you're going to help me write a screen saver in MacOS.  We're using Xcode 12.4 and writing in Objective C.  We'll start by setting some initial ideations:
a) Main class will be called `EarlSaverView`
b) The screen saver will display a web site - the URL for the website will be extracted from an app resource file called `config.json`
c) Try to use the native `WKWebView` class
d) Please separate prototypes and header info into a `EarlSaverView.h` file and the underling code into a `EarlSaverView.m` file
```


&nbsp;<br>&nbsp;

---

Made with :heart: by **Silvino Rodrigues**
