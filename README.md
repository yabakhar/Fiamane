# Fiamane Project

A Fiamane project was created in Flutter using Provider. Fiamane supports both web and mobile.


https://github.com/yabakhar/Fiamane/assets/38636953/2a9aebc7-4cb0-4c25-a71b-24f027435e8c


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/yabakhar/Fiamane.git
```

**Step 2:**

Go to the project root and execute the following command in the console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses the `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch the command to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

To hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under the `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files: Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## Fiamane Features:

* Theme
* Dio
* Database
* Provider (State Management)
* Singleton Design Pattern
* Dependency Injection
* Dark Theme Support


### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Provider](https://github.com/rrousselGit/provider) (State Management)
* [Json Serialization](https://github.com/dart-lang/json_serializable)
* [shared_preferences]
* [equatable]
* [dartz]


### Folder Structure
Here is the core folder structure which Flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- features/
```

