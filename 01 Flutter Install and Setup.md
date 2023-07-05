# 01 Flutter Install and Setup [Flutter Documentation](https://docs.flutter.dev/)
## Install Flutter in Windows 10 or Windows 11
  - First INSTALL `GIT` [Git offical page](https://git-scm.com/download/win)
  - Download the 64-bit Git for Windows Setup. file 
  - click next-next-next and install. (don't change any options)
  - DOWNLOAD `Flutter SDK`(Software Development Kit) https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.10.3-stable.zip
  - Extract the zip file in `C:\src\flutter` as file name `flutter`.
  - After Extracting `Update your path` in `Edit environment variables`.
    - past the `C:\src\flutter\bin` path in `System Variable`.
    - run the Command to verify the Flutter is installed or not.
```
where flutter dart
```
**Output**

![image](https://github.com/KKBUGHUNTER/Flutter/assets/91019132/3b5617cb-8c4f-401e-bc2d-d96906b7c21c)

```
flutter doctor
```
  - And also install `Android Studio` https://developer.android.com/studio

```
flutter doctor --android-licenses
```
