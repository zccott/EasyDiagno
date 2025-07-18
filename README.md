# EasyDiagno

A new Flutter project for symptom checking and finding nearby hospitals.

## Features

- **Symptom Checker:** Users can input their symptoms and get a possible diagnosis based on a machine learning model.
- **Nearby Hospitals:** Users can find hospitals near their location.
- **User Authentication:** Users can create an account and log in to the app.
- **Hospital Registration:** Hospitals can register their services on the app.
- **Admin Module:** An admin module to manage registered hospitals and users.

## Tech Stack

- **Frontend:** Flutter
- **Backend:** Firebase (Authentication, Firestore)
- **Machine Learning:** Python, Scikit-learn (for the symptom checker model)

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/zccott/EasyDiagno.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

```
├───.gitignore
├───.metadata
├───analysis_options.yaml
├───pubspec.lock
├───pubspec.yaml
├───README.md
├───.git/...
├───ai/
│   ├───Deasease.ipynb
│   ├───DentalDux.zip
│   └───Symptom2Disease.csv
├───android/
│   ├───.gitignore
│   ├───build.gradle
│   ├───gradle.properties
│   ├───settings.gradle
│   ├───app/
│   │   ├───build.gradle
│   │   └───src/
│   │       ├───google-services.json
│   │       ├───debug/
│   │       │   └───AndroidManifest.xml
│   │       ├───main/
│   │       │   ├───AndroidManifest.xml
│   │       │   ├───kotlin/
│   │       │   └───res/
│   │       └───profile/
│   │           └───AndroidManifest.xml
│   └───gradle/
│       └───wrapper/
│           └───gradle-wrapper.properties
├───assets/
│   └───images/
│       ├───bg.jpg
│       ├───loading.png
│       ├───loading1.gif
│       └───welcome_image.svg
├───ios/
│   ├───.gitignore
│   ├───Flutter/
│   │   ├───AppFrameworkInfo.plist
│   │   ├───Debug.xcconfig
│   │   └───Release.xcconfig
│   ├───Runner/
│   │   ├───AppDelegate.swift
│   │   ├───Info.plist
│   │   ├───Runner-Bridging-Header.h
│   │   ├───Assets.xcassets/
│   │   │   ├───AppIcon.appiconset/
│   │   │   │   ├───Contents.json
│   │   │   │   ├───Icon-App-1024x1024@1x.png
│   │   │   │   ├───Icon-App-20x20@1x.png
│   │   │   │   ├───Icon-App-20x20@2x.png
│   │   │   │   ├───Icon-App-20x20@3x.png
│   │   │   │   ├───Icon-App-29x29@1x.png
│   │   │   │   ├───Icon-App-29x29@2x.png
│   │   │   │   ├───Icon-App-29x29@3x.png
│   │   │   │   ├───Icon-App-40x40@1x.png
│   │   │   │   ├───Icon-App-40x40@2x.png
│   │   │   │   └───Icon-App-40x40@3x.png
│   │   │   │   └───...
│   │   │   └───LaunchImage.imageset/
│   │   └───Base.lproj/
│   │       ├───LaunchScreen.storyboard
│   │       └───Main.storyboard
│   ├───Runner.xcodeproj/
│   │   ├───project.pbxproj
│   │   ├───project.xcworkspace/
│   │   │   ├───contents.xcworkspacedata
│   │   │   └───xcshareddata/
│   │   └───xcshareddata/
│   │       └───xcschemes/
│   ├───Runner.xcworkspace/
│   │   ├───contents.xcworkspacedata
│   │   └───xcshareddata/
│   │       ├───IDEWorkspaceChecks.plist
│   │       └───WorkspaceSettings.xcsettings
│   └───RunnerTests/
│       └───RunnerTests.swift
├───lib/
│   ├───main.dart
│   ├───map.dart
│   ├───Constants/
│   │   ├───Colors.dart
│   │   └───constants.dart
│   ├───Models/
│   │   ├───HospitalModel/
│   │   │   ├───registrationDB.dart
│   │   │   ├───regscreen1/
│   │   │   └───regscreen2/
│   │   └───UserModel/
│   │       ├───userCompleteModel.dart
│   │       ├───userLogin.dart
│   │       └───userRegistration.dart
│   ├───screens/
│   │   ├───AdminModule/
│   │   │   ├───AdminHome.dart
│   │   │   ├───HospitalsRegistered.dart
│   │   │   ├───HospitalsRequested.dart
│   │   │   └───UsersRegistered.dart
│   │   ├───AppHome/
│   │   │   ├───ChatBotScreen.dart
│   │   │   ├───ClinicHome.dart
│   │   │   ├───ClinicPage.dart
│   │   │   ├───ClinicPage1.dart
│   │   │   ├───Homescreen.dart
│   │   │   └───ProfileScreen.dart
│   │   ├───HospitalRegistration/
│   │   │   ├───hospitalRegistration.dart
│   │   │   ├───RegisteredScreen.dart
│   │   │   └───Registration2/
│   │   └───Login_Signup/
│   │       ├───LoginScreen.dart
│   │       ├───SignupScreen.dart
│   │       ├───SplashScreen.dart
│   │       └───WelcomeScreen.dart
│   ├───Services/
│   │   └───UserModule/
│   │       ├───userCompleteProfile.dart
│   │       ├───userLogin.dart
│   │       └───userRegRepo.dart
│   └───widgets/
│       └───Textfields/
│           └───CustomTextField.dart
├───linux/
│   ├───.gitignore
│   ├───CMakeLists.txt
│   ├───main.cc
│   ├───my_application.cc
│   ├───my_application.h
│   └───flutter/
│       ├───CMakeLists.txt
│       ├───generated_plugin_registrant.cc
│       ├───generated_plugin_registrant.h
│       └───generated_plugins.cmake
├───macos/
│   ├───.gitignore
│   ├───Flutter/
│   │   ├───Flutter-Debug.xcconfig
│   │   ├───Flutter-Release.xcconfig
│   │   └───GeneratedPluginRegistrant.swift
│   ├───Runner/
│   │   ├───AppDelegate.swift
│   │   ├───DebugProfile.entitlements
│   │   ├───Info.plist
│   │   ├───MainFlutterWindow.swift
│   │   ├───Release.entitlements
│   │   ├───Assets.xcassets/
│   │   │   └───AppIcon.appiconset/
│   │   ├───Base.lproj/
│   │   │   └───MainMenu.xib
│   │   └───Configs/
│   │       ├───AppInfo.xcconfig
│   │       ├───Debug.xcconfig
│   │       ├───Release.xcconfig
│   │       └───Warnings.xcconfig
│   ├───Runner.xcodeproj/
│   │   ├───project.pbxproj
│   │   ├───project.xcworkspace/
│   │   │   └───xcshareddata/
│   │   └───xcshareddata/
│   │       └───xcschemes/
│   ├───Runner.xcworkspace/
│   │   ├───contents.xcworkspacedata
│   │   └───xcshareddata/
│   │       └───IDEWorkspaceChecks.plist
│   └───RunnerTests/
│       └───RunnerTests.swift
├───test/
│   └───widget_test.dart
├───web/
│   ├───favicon.png
│   ├───index.html
│   ├───manifest.json
│   └───icons/
│       ├───Icon-192.png
│       ├───Icon-512.png
│       ├───Icon-maskable-192.png
│       └───Icon-maskable-512.png
└───windows/
    ├───.gitignore
    ├───CMakeLists.txt
    ├───flutter/
    │   ├───CMakeLists.txt
    │   ├───generated_plugin_registrant.cc
    │   ├───generated_plugin_registrant.h
    │   └───generated_plugins.cmake
    └───runner/
        ├───CMakeLists.txt
        ├───flutter_window.cpp
        ├───flutter_window.h
        ├───main.cpp
        ├───resource.h
        ├───runner.exe.manifest
        ├───Runner.rc
        ├───utils.cpp
        ├───utils.h
        ├───win32_window.cpp
        ├───win32_window.h
        └───resources/
            └───app_icon.ico
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.