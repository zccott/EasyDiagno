# EasyDiagno

A Flutter application designed to assist users with symptom checking and locating nearby hospitals.

## Features

-   **Symptom Checker (AI-Powered Chatbot):** Users can input their symptoms into an interactive chatbot that provides a possible diagnosis based on a machine learning model. The chatbot can also suggest relevant hospital departments.
-   **Hospital Locator:** Users can find hospitals near their location, filtered by specialization or department.
-   **User Authentication:** Secure user registration and login functionality.
-   **Hospital Registration:** Hospitals can register their services and details on the platform.
-   **Admin Module:** A dedicated module for administrators to manage registered users and hospitals, including approval/rejection of hospital registration requests.
-   **User Profiles:** Users can manage their profiles within the application.

## Tech Stack

-   **Frontend:** Flutter (Dart)
-   **Backend:** Firebase (Authentication, Firestore for data storage)
-   **Machine Learning:** Python (for the symptom checker model, likely integrated via an API)
-   **Location Services:** Integration for finding nearby hospitals.
-   **HTTP:** For API communication.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/zccott/EasyDiagno.git
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```
    *Note: Ensure you have Flutter and Dart SDKs installed and configured.*

## Project Structure

```
├───README.md
├───.git/...
├───ai/
│   ├───Deasease.ipynb
│   ├───DentalDux.zip
│   └───Symptom2Disease.csv
├───backend/
│   ├───.idea/
│   │   ├───.gitignore
│   │   ├───Easydiagno.iml
│   │   ├───misc.xml
│   │   ├───modules.xml
│   │   └───inspectionProfiles/
│   │       └───profiles_settings.xml
│   └───src/
│       ├───__init__.py
│       ├───easydiagnoapp.py
│       ├───mainfile.py
│       ├───Symptom2Disease.csv
│       ├───__pycache__/
│       │   ├───__init__.cpython-312.pyc
│       │   └───mainfile.cpython-312.pyc
│       └───static/
│           ├───20240307_155541.jpg
│           ├───20240309_114339.jpg
│           ├───20240309_114729.jpg
│           ├───20240309_114802.jpg
│           ├───20240309_114854.jpg
│           ├───20240309_114938.jpg
│           └───20240309_115036.jpg
└───mobile/
    ├───.gitignore
    ├───.metadata
    ├───analysis_options.yaml
    ├───pubspec.lock
    ├───pubspec.yaml
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
    │   │       ├───main/
    │   │       └───profile/
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
    │   ├───halo.py
    │   ├───main.dart
    │   ├───map.dart
    │   ├───Constants/
    │   │   ├───Colors.dart
    │   │   └───constants.dart
    │   ├───Models/
    │   │   ├───constantShared.dart
    │   │   ├───AdminModel/
    │   │   │   ├───allHospitalModel.dart
    │   │   │   ├───hospitalReqModel.dart
    │   │   │   └───usersByAdminModel.dart
    │   │   ├───HospitalModel/
    │   │   │   ├───getSpecialisation.dart
    │   │   │   ├───HospitalAllDetails.dart
    │   │   │   ├───hospitalBaseModel.dart
    │   │   │   ├───hospitalReg1Model.dart
    │   │   │   ├───registrationDB.dart
    │   │   │   ├───regscreen1/
    │   │   │   └───regscreen2/
    │   │   └───UserModel/
    │   │       ├───chatReplayModel.dart
    │   │       ├───loginModel.dart
    │   │       ├───loginResponce.dart
    │   │       ├───userCompleteModel.dart
    │   │       └───userRegistration.dart
    │   ├───screens/
    │   │   ├───Admin/
    │   │   │   ├───AdminHome.dart
    │   │   │   ├───HospitalRegistered.dart
    │   │   │   ├───HospitalRequested.dart
    │   │   │   └───UserRegistered.dart
    │   │   ├───AdminModule/
    │   │   │   ├───AdminHome.dart
    │   │   │   ├───HospitalsRegistered.dart
    │   │   │   └───HospitalsRequested.dart
    │   │   │   └───...
    │   │   ├───AppHome/
    │   │   ├───HospitalRegistration/
    │   │   └───Login_Signup/
    │   ├───Services/
    │   │   ├───AdminModule/
    │   │   ├───hospital Module/
    │   │   └───UserModule/
    │   └───widgets/
    │       └───Textfields/
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
    │   │   ├───Base.lproj/
    │   │   └───Configs/
    │   ├───Runner.xcodeproj/
    │   │   ├───project.pbxproj
    │   │   ├───project.xcworkspace/
    │   │   └───xcshareddata/
    │   ├───Runner.xcworkspace/
    │   │   ├───contents.xcworkspacedata
    │   │   └───xcshareddata/
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
```

## API Reference

The application communicates with a backend API for various functionalities. The base URL for the API is not specified in the provided code, but the following endpoints are used:

**Authentication:**

*   **User Login:** `http://localhost:5000/api/user/login`
*   **User Registration:** `http://localhost:5000/api/user/register`
*   **User Profile Completion:** `http://localhost:5000/api/user/complete/profile`

**Admin:**

*   **Get All Users:** `http://localhost:5000/api/admin/users`
*   **Get All Hospitals:** `http://localhost:5000/api/admin/hospitals`
*   **Get Hospital Requests:** `http://localhost:5000/api/admin/hospital/requests`
*   **Approve Hospital Request:** `http://localhost:5000/api/admin/hospital/approve`
*   **Reject Hospital Request:** `http://localhost:5000/api/admin/hospital/reject`
*   **Delete User:** `http://localhost:5000/api/admin/user/delete`
*   **Delete Hospital:** `http://localhost:5000/api/admin/hospital/delete`

**Hospital:**

*   **Register Hospital:** `http://localhost:5000/api/hospital/register`
*   **Get Hospital by ID:** `http://localhost:5000/api/hospital/`
*   **Get Hospital by Specialization:** `http://localhost:5000/api/hospital/specialization/`
*   **Get All Specializations:** `http://localhost:5000/api/specializations`
*   **Add Doctor:** `http://localhost:5000/api/hospital/add/doctor`

**Chatbot:**

*   **Get Chatbot Reply:** `http://localhost:5000/api/chatbot/reply`

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
Comment
