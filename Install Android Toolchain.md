### **Install Android Toolchain for Flutter Development on Ubuntu**  

Since `flutter doctor` shows **"Unable to locate Android SDK"**, you need to install the **Android SDK** and **configure Flutter** to recognize it.

---

### **1. Install Android Studio (Recommended)**
Run the following commands:  
```sh
sudo apt update
sudo apt install curl wget -y
```
Download and install Android Studio:  
```sh
cd ~/Downloads
wget https://redirector.gvt1.com/edgedl/android/studio/install/2024.1.1.21/android-studio-2024.1.1.21-linux.tar.gz
tar -xvf android-studio-2024.1.1.21-linux.tar.gz
sudo mv android-studio /opt/
```
Run Android Studio:
```sh
/opt/android-studio/bin/studio.sh
```
**Follow the setup wizard** and install the **Android SDK** and necessary components.

---

### **2. Install the Android SDK Without Android Studio (Alternative)**
If you don't want Android Studio, install the **command-line SDK tools**:
```sh
mkdir -p ~/Android/Sdk
cd ~/Android/Sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-*.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/
rm commandlinetools-linux-*.zip
```
Then, install necessary packages:
```sh
yes | ~/Android/Sdk/cmdline-tools/latest/bin/sdkmanager --sdk_root=$HOME/Android/Sdk "platform-tools" "platforms;android-34" "build-tools;34.0.0"
```

---

### **3. Configure Flutter to Recognize the Android SDK**
Run:
```sh
flutter config --android-sdk ~/Android/Sdk
```

If you installed via Android Studio, run:
```sh
flutter config --android-sdk $HOME/Android/Sdk
```

---

### **4. Accept Android SDK Licenses**
Run:
```sh
flutter doctor --android-licenses
```
Type **`y`** to accept all licenses.

---

### **5. Verify Installation**
Run:
```sh
flutter doctor
```
You should see `[✓] Android toolchain - develop for Android devices`.

Now, your Flutter environment is ready for Android development! 🚀
