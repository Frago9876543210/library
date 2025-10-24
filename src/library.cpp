#include <jni.h>
#include <android/log.h>

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    __android_log_print(ANDROID_LOG_INFO, "MY_LIBRARY", "JNI_OnLoad");
    return JNI_VERSION_1_6;
}

extern "C" [[gnu::visibility("default")]] void LeviMod_Load(JavaVM *vm) {
    __android_log_print(ANDROID_LOG_INFO, "MY_LIBRARY", "LeviMod_Load");
}
