# UniApp X Android 离线打包：从零开始的完整指南

> 本文从创建全新 Android 项目开始，一步步配置 UniApp X 离线打包环境。纯命令行操作。

## 环境准备

**下载 UniApp X Android SDK：**
https://web-ext-storage.dcloud.net.cn/uni-app-x/sdk/Android/Android-uni-app-x-SDK@14196-4.87.zip

> ⚠️ 注意：这是 uni-app **X** 的 SDK，不是传统 uni-app SDK！

```bash
# 设置环境变量（替换为你的实际路径）
export SDK_PATH=~/Downloads/Android-uni-app-x-SDK  # UniApp X SDK 解压路径
```

---

## 第一步：创建项目目录结构

```bash
# 创建项目目录
mkdir -p ~/AndroidStudioProjects/MyUniAppX
cd ~/AndroidStudioProjects/MyUniAppX

# 创建所有需要的目录
mkdir -p plugins
mkdir -p gradle/wrapper
mkdir -p app/src/main/java/com/example/myuniappx
mkdir -p app/src/main/res/values
mkdir -p uniappx/libs
mkdir -p uniappx/src/main/java
mkdir -p uniappx/src/main/res/values
mkdir -p uniappx/src/main/assets/apps
```

---

## 第二步：创建 Gradle Wrapper（不需要预装 gradle）

### gradle/wrapper/gradle-wrapper.properties

```bash
cat > gradle/wrapper/gradle-wrapper.properties << 'EOF'
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF
```

### gradlew (Unix 脚本)

```bash
curl -o gradlew https://raw.githubusercontent.com/gradle/gradle/master/gradlew
chmod +x gradlew
```

或者手动创建：

```bash
cat > gradlew << 'GRADLEW_EOF'
#!/bin/sh
DIRNAME=$(dirname "$0")
APP_BASE_NAME=$(basename "$0")
cd "$DIRNAME" || exit 1
exec java -classpath "$DIRNAME/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"
GRADLEW_EOF
chmod +x gradlew
```

### 下载 gradle-wrapper.jar

```bash
curl -L -o gradle/wrapper/gradle-wrapper.jar \
  https://github.com/AntennaPod/AntennaPod/raw/refs/heads/master/gradle/wrapper/gradle-wrapper.jar
```

---

## 第三步：创建 Gradle 配置文件

### settings.gradle

```bash
cat > settings.gradle << 'EOF'
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
        flatDir { dirs('./plugins/') }
    }
}

rootProject.name = "MyUniAppX"
include ':app'
include ':uniappx'
EOF
```

### build.gradle (根目录)

```bash
cat > build.gradle << 'EOF'
buildscript {
    dependencies {
        classpath(files('plugins/uts-kotlin-compiler-plugin-0.0.1.jar'))
        classpath(files('plugins/uts-kotlin-gradle-plugin-0.0.1.jar'))
    }
}

plugins {
    id 'com.android.application' version '8.2.2' apply false
    id 'com.android.library' version '8.2.2' apply false
    id 'org.jetbrains.kotlin.android' version '1.9.10' apply false
}
EOF
```

### gradle.properties

```bash
cat > gradle.properties << 'EOF'
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
kotlin.code.style=official
EOF
```

---

## 第四步：创建 app 主模块

### app/build.gradle

```bash
cat > app/build.gradle << 'EOF'
plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android'
}

android {
    namespace 'com.example.myuniappx'
    compileSdk 34

    defaultConfig {
        applicationId "com.example.myuniappx"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }

    aaptOptions {
        additionalParameters '--auto-add-overlay'
        ignoreAssetsPattern '!.svn:!.git:.*:!CVS:!thumbs.db:!picasa.ini:!*.scc:*~'
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_11
        targetCompatibility JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = '11'
    }
}

dependencies {
    implementation project(':uniappx')
    implementation fileTree(include: ['*.aar'], dir: '../uniappx/libs')
    implementation 'androidx.core:core-ktx:1.10.1'
    implementation 'androidx.appcompat:appcompat:1.6.1'
}
EOF
```

### app/src/main/AndroidManifest.xml

```bash
cat > app/src/main/AndroidManifest.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/Theme.AppCompat.Light">
    </application>
</manifest>
EOF
```

### app/src/main/res/values/strings.xml

```bash
cat > app/src/main/res/values/strings.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">MyUniAppX</string>
</resources>
EOF
```

---

## 第五步：创建 uniappx 模块

### uniappx/build.gradle

```bash
cat > uniappx/build.gradle << 'EOF'
plugins {
    id 'com.android.library'
    id 'org.jetbrains.kotlin.android'
    id 'io.dcloud.uts.kotlin'
}

android {
    namespace 'io.dcloud.uniappx'
    compileSdk 34

    defaultConfig {
        minSdk 21
        targetSdk 34
    }

    aaptOptions {
        additionalParameters '--auto-add-overlay'
        ignoreAssetsPattern '!.svn:!.git:.*:!CVS:!thumbs.db:!picasa.ini:!*.scc:*~'
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_11
        targetCompatibility JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = '11'
    }
}

dependencies {
    implementation fileTree(include: ['*.aar'], dir: './libs')
    implementation "androidx.core:core-ktx:1.10.1"
    implementation "androidx.recyclerview:recyclerview:1.3.2"
    implementation "androidx.appcompat:appcompat:1.0.0"
    implementation "androidx.exifinterface:exifinterface:1.3.6"
    implementation "androidx.localbroadcastmanager:localbroadcastmanager:1.0.0@aar"
    implementation "androidx.constraintlayout:constraintlayout:2.1.4"
    implementation "androidx.webkit:webkit:1.6.0"
    implementation "com.google.android.material:material:1.4.0"
    implementation "androidx.viewpager2:viewpager2:1.1.0-beta02"
    implementation "com.alibaba:fastjson:1.2.83"
    implementation "com.facebook.fresco:fresco:3.4.0"
    implementation "com.facebook.fresco:middleware:3.4.0"
    implementation "com.facebook.fresco:animated-gif:3.4.0"
    implementation "com.facebook.fresco:webpsupport:3.4.0"
    implementation "com.facebook.fresco:animated-webp:3.4.0"
    implementation "com.caverock:androidsvg:1.4"
    implementation "com.github.bumptech.glide:glide:4.9.0"
    implementation "org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4"
    implementation "org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4"
    implementation "org.jetbrains.kotlin:kotlin-stdlib:1.9.10"
    implementation "org.jetbrains.kotlin:kotlin-reflect:1.9.10"
    implementation "org.jetbrains.kotlinx:kotlinx-serialization-json:1.4.1"
    implementation "com.squareup.okhttp3:okhttp:3.12.12"
    implementation "com.github.getActivity:XXPermissions:18.63"
    implementation "net.lingala.zip4j:zip4j:2.11.5"
}
EOF
```

### uniappx/src/main/AndroidManifest.xml

```bash
cat > uniappx/src/main/AndroidManifest.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application android:name="io.dcloud.uniapp.UniApplication">
        <activity
            android:name="io.dcloud.uniapp.UniAppActivity"
            android:configChanges="orientation|keyboard|keyboardHidden|smallestScreenSize|screenLayout|screenSize|mcc|mnc|fontScale|navigation|uiMode"
            android:exported="true"
            android:screenOrientation="portrait"
            android:theme="@style/UniAppX.Activity.DefaultTheme"
            android:windowSoftInputMode="adjustResize"
            tools:replace="android:exported,android:theme,android:configChanges,android:windowSoftInputMode,android:screenOrientation">
        </activity>

        <meta-data
            android:name="DCLOUD_UNI_APPID"
            android:value="__UNI__YOUR_APPID" />

        <meta-data
            android:name="DCLOUD_CHANNEL"
            android:value="google" />
    </application>
</manifest>
EOF
```

### uniappx/src/main/res/values/strings.xml

```bash
cat > uniappx/src/main/res/values/strings.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">UniAppX</string>
</resources>
EOF
```

---

## 第六步：复制 SDK 文件

```bash
# 复制 gradle 插件
cp $SDK_PATH/plugins/uts-kotlin-compiler-plugin-0.0.1.jar ./plugins/
cp $SDK_PATH/plugins/uts-kotlin-gradle-plugin-0.0.1.jar ./plugins/

# 复制 AAR 文件
cp $SDK_PATH/libs/*.aar ./uniappx/libs/

# 验证
echo "=== plugins 目录 ==="
ls -la plugins/
echo "=== uniappx/libs 目录 ==="
ls -la uniappx/libs/
```

---

## 第七步：导出 HBuilderX 资源

在 HBuilderX 中：发行 → 原生App-本地打包 → 生成本地打包App资源

```bash
# 设置变量
export APPID=__UNI__XXXXXX
export HBX_PROJECT=/path/to/your/hbuilderx/project

# 复制资源
cp -r $HBX_PROJECT/unpackage/resources/app-android/$APPID ./uniappx/src/main/assets/apps/

# 复制 Kotlin 源码
cp -r $HBX_PROJECT/unpackage/resource/app-android/uniappx/app-android/src/* ./uniappx/src/main/java/

# 更新 AndroidManifest.xml 中的 APPID
sed -i '' "s/__UNI__YOUR_APPID/$APPID/g" uniappx/src/main/AndroidManifest.xml
```

---

## 第八步：编译

```bash
# 首次运行会下载 gradle
./gradlew assembleDebug

# 安装到设备
adb install app/build/outputs/apk/debug/app-debug.apk
```

---

## 项目结构

```
MyUniAppX/
├── gradlew                   # Gradle wrapper 脚本
├── gradle/wrapper/
│   ├── gradle-wrapper.jar
│   └── gradle-wrapper.properties
├── build.gradle
├── settings.gradle
├── gradle.properties
├── plugins/                  # UTS 插件
│   ├── uts-kotlin-compiler-plugin-0.0.1.jar
│   └── uts-kotlin-gradle-plugin-0.0.1.jar
├── app/
│   ├── build.gradle
│   └── src/main/
│       ├── AndroidManifest.xml
│       └── res/values/strings.xml
└── uniappx/
    ├── build.gradle
    ├── libs/*.aar            # SDK AAR (19个)
    └── src/main/
        ├── AndroidManifest.xml
        ├── assets/apps/__UNI__XXX/
        ├── java/             # Kotlin 代码
        └── res/values/strings.xml
```

---

*最后更新：2026-01-14*
