### library

Mod for Minecraft Bedrock Edition

### Requirements

- CMake 3.20 or higher: https://cmake.org/download/
- Android NDK r27c: https://github.com/android/ndk/releases/tag/r27c

```bash
PATH_TO_NDK=~/Android/Sdk/ndk/27.2.12479018
```

### Android arm64-v8a

```bash
./build.sh $PATH_TO_NDK
adb shell mkdir -p /sdcard/games/org.levimc/minecraft/com.mojang.minecraftpe/mods
adb push ./build/bin/liblibrary.so /sdcard/games/org.levimc/minecraft/com.mojang.minecraftpe/mods
```

```bash
adb shell am start -n org.levimc.launcher/org.levimc.launcher.ui.activities.SplashActivity
```

```bash
adb logcat --pid $(adb shell pidof org.levimc.launcher) | grep MY_LIBRARY
```

```
10-24 15:19:07.111 31428 31510 I MY_LIBRARY: JNI_OnLoad
```

`void LeviMod_Load(JavaVM *vm)` is not called!
