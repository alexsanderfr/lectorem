# Lectorem

RSS reader app

## Screenshots

|![](https://raw.githubusercontent.com/alexsanderfr/lectorem/master/screenshots/login.png) | ![](https://raw.githubusercontent.com/alexsanderfr/lectorem/master/screenshots/subscriptions.png) | 
|:-------------------------:|:-------------------------:|
|![](https://raw.githubusercontent.com/alexsanderfr/lectorem/master/screenshots/entry_list.png)  |  ![](https://raw.githubusercontent.com/alexsanderfr/lectorem/master/screenshots/entry.png)|



## Prerequisites

```
Android Studio
```

## Installing

```
Clone this repo
Open with Android Studio
Run 'flutter pub get'
Run 'flutter pub run build_runner build'
Create a file named 'keys.dart' inside lib/
Get most recent feedly's sandbox URL, client ID and client secret from Feedly
Create a class named 'Keys' inside 'keys.dart'
Put String constants for 'apiUrl', 'clientId' and 'clientSecret' inside the 'Keys' class 
Run in device or emulator
```

## Built With

* [Android Studio](https://developer.android.com/studio/index.html) - Android Development IDE
* [Flutter](https://flutter.dev/) - Flutter platform
* [Feedly API](https://developer.feedly.com/) - Feedly API

## Authors

* **Alexsander Franco** -  [alexsanderfr](https://github.com/alexsanderfr)

## Acknowledgments

* Thanks to [Feedly](https://feedly.com) for providing the Feedly API.