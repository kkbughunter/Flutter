# Flutter
Here’s a concise guide for installing and configuring Flutter along with the Linux toolchain and Android toolchain on a Linux system:

### 1. **System Requirements**
Ensure your system meets the following requirements:
- 64-bit Linux distribution
- Ubuntu 20.04 or later is recommended

### 2. **Install Required Dependencies**
Open your terminal and run the following commands to install necessary dependencies:

```bash
sudo apt update
sudo apt install git curl wget unzip xz-utils zip
sudo apt install libglu1-mesa libxi6 libgconf-2-4 libgtk-3-dev
```

### 3. **Install Flutter**
1. **Download Flutter SDK:**
   ```bash
   cd ~/development
   git clone https://github.com/flutter/flutter.git -b stable
   ```

2. **Add Flutter to PATH:**
   Add the following lines to your `~/.bashrc` or `~/.bash_profile`:
   ```bash
   export FLUTTER_HOME="$HOME/development/flutter"
   export PATH="$PATH:$FLUTTER_HOME/bin"
   ```

3. **Apply the changes:**
   ```bash
   source ~/.bashrc
   ```

### 4. **Install Android Studio and SDK**
1. **Install Android Studio:**
   You can download it from [Android Studio](https://developer.android.com/studio#downloads) or use:
   ```bash
   sudo snap install android-studio --classic
   ```

2. **Configure the Android SDK:**
   Launch Android Studio, go to **Configure > SDK Manager** and ensure you install:
   - Android SDK
   - Android SDK Platform-Tools
   - Android SDK Build-Tools

### 5. **Set Up Android Command-Line Tools**
If you prefer using command-line tools instead of Android Studio, install the Android command-line tools as follows:

1. **Download Command Line Tools:**
   - Navigate to [Android Command Line Tools](https://developer.android.com/studio#command-tools) and download the package for Linux.

2. **Extract the package:**
   ```bash
   mkdir -p ~/Android/Sdk/cmdline-tools
   unzip commandlinetools-linux-*.zip -d ~/Android/Sdk/cmdline-tools
   ```

3. **Set up the environment variables:**
   Add the following lines to your `~/.bashrc` or `~/.bash_profile`:
   ```bash
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
   ```

4. **Apply the changes:**
   ```bash
   source ~/.bashrc
   ```

### 6. **Configure Flutter with Android SDK**
Run the following command to point Flutter to the Android SDK location:
```bash
flutter config --android-sdk ~/Android/Sdk
```

### 7. **Install Chrome (for web development)**
If you want to develop for the web, install Chrome:
```bash
sudo apt install google-chrome-stable
```

### 8. **Verify the Installation**
Run `flutter doctor` to check if everything is set up correctly:
```bash
flutter doctor
```
