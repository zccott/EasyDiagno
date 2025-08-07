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
.
├───ai/                     # Contains machine learning models and data (e.g., symptom-to-disease mapping)
├───android/                # Android specific project files
├───assets/                 # Application assets like images and SVGs
├───ios/                    # iOS specific project files
├───lib/                    # Main Flutter application source code
│   ├───Constants/          # Defines application-wide constants (colors, strings)
│   ├───Models/             # Data models for users, hospitals, and other entities
│   ├───screens/            # UI screens categorized by module (Admin, AppHome, HospitalRegistration, Login_Signup)
│   │   ├───AdminModule/    # Screens for administrator functionalities
│   │   ├───AppHome/        # Core application screens including chatbot and hospital listings
│   │   ├───HospitalRegistration/ # Screens for hospital registration process
│   │   └───Login_Signup/   # User authentication and onboarding screens
│   ├───Services/           # API service integrations and business logic
│   └───widgets/            # Reusable UI widgets (e.g., custom text fields)
├───linux/                  # Linux specific project files
├───macos/                  # macOS specific project files
├───test/                   # Unit and widget tests
├───web/                    # Web specific project files
└───windows/                # Windows specific project files
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
