
## Flutter Project : DayTask

## Overview
This project is a Flutter application that utilizes Supabase as its backend service for data storage, authentication, and real-time capabilities. This README provides a comprehensive guide on how to set up the project, configure Supabase, and explains the concepts of hot reload and hot restart in the context of Flutter development.

## Setup Instructions
To get started with building and running the Flutter application, please follow the steps outlined below:

## Prerequisites
Before you begin, ensure you have the following installed:

Flutter SDK: Install Flutter
Dart SDK: This comes bundled with Flutter.
IDE: Install and set up an IDE of your preference (e.g., Flutter Plugin for Android Studio, Visual Studio Code).
Supabase Account: You need an active account on Supabase.io.

1.Clone the Repository
   Open your terminal and run the following command to clone the project repository:

git clone https://github.com/Yousufalipangat/DayTask.git
cd project_name

2. Install Dependencies
   Run the following command to get the required dependencies with Flutter's package manager:

flutter pub get

3. Configure Supabase
   a. Create a New Project in Supabase
   Log in to your Supabase account.
   Click on the "New Project" button.
   Fill in the project details (Name, database password, region, etc.) and click "Create new project."
   b. Set Up Database Tables
   Go to the "Table Editor" section in your Supabase dashboard.
   Create the necessary tables for your application ('Tasks').
   Define the columns and their data types based on your application's requirements.
   c. Configure API Keys
   Navigate to "Settings" then "API" in the Supabase dashboard.
   Copy your project’s URL and Anon Key for use in the Flutter app.
4. Configure Environment Variables in Flutter
   Create a Dart file for environment configuration, such as lib/config.dart, and define your Supabase URL and API keys:

copy
dart

class Config {
static const String supabaseUrl = 'https://YOUR_SUPABASE_URL';
static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
}
Make sure to replace YOUR_SUPABASE_URL and YOUR_SUPABASE_ANON_KEY with the actual values from your Supabase project.

Alternatively Using Flutter Dotenv
You can also use a package like flutter_dotenv to manage your environment variables more securely:

Add the flutter_dotenv dependency to pubspec.yaml:

dependencies:
flutter_dotenv: ^5.0.2

Create a .env file in the root of your Flutter project and add your Supabase details:

copy
SUPABASE_URL=https://YOUR_SUPABASE_URL
SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
Load the environment variables at the start of your application:


import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
await dotenv.load(fileName: '.env');
runApp(MyApp());
}
5. Run the Application
   To run the application, execute the following command in your terminal:



flutter run
This command will compile the Flutter app and launch it on the connected device or emulator.

Supabase Setup Steps
Follow the setup steps to configure the Supabase backend:

1. Create New Project in Supabase
   Go to the Supabase dashboard and create a new project.
2. Database Tables Configuration
   Use the "Table Editor" to create tables relevant to your application.
   Define the schema (column names, types, etc.) that suits your app's requirements.
3. Set Up Authentication
   Navigate to the "Authentication" section.
   Configure the required authentication settings (e.g., email/password) as suited for your application.
4. Configure API Policies
   Go to "Policies" for each table in the Table Editor.
   Define Row Level Security policies to allow or restrict access to data based on user roles or authenticated states.
5. Obtain Supabase API Keys
   On the API settings page, copy your project URL and Anon Key for usage in your app’s configuration file.
   Hot Reload vs Hot Restart in Flutter
   Understanding the nuances of hot reload and hot restart is key in Flutter development:

Hot Reload
Definition: Hot reload allows you to inject changes to your Dart code into the Dart Virtual Machine (VM) without needing to restart your app. It preserves the application state.
Use Case: Ideal for UI tweaks, fixing bugs, and adding new UI components. Changes made to the widget tree are reflected in real-time, allowing you to iterate quickly.
Hot Restart
Definition: Hot restart completely restarts your application and reinitializes the app’s state. It rebuilds the app from the beginning.
Use Case: Necessary when making changes to the main application setup, altering global state or updating dependencies that cannot be applied with hot reload.
Summary
Use hot reload for rapid iterations on UI and other minor adjustments where maintaining the state is beneficial.
Use hot restart when major changes are made that require a fresh start of the application.
This README is meant to guide you through the initial setup and configuration processes for your Flutter app backed by Supabase. If you have any questions or encounter issues, feel free to check back here or reach out to the development team for assistance. Happy coding!
