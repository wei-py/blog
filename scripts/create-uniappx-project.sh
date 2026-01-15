#!/bin/bash
# ============================================
# uni-app x Android 项目脚手架
# 严格按照官方文档: https://doc.dcloud.net.cn/uni-app-x/native/use/android.html
# 用法: ./create-uniappx-project.sh <项目名> [包名]
# 示例: ./create-uniappx-project.sh MyApp uni.app.UNI5067A0E
# ============================================

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 配置
SDK_PATH="/d/soft/Android/Sdk"
PLUGINS_PATH="/d/soft/Android/plugins"
GRADLE_VERSION="8.4"
COMPILE_SDK="34"
MIN_SDK="21"
TARGET_SDK="34"
BUILD_TOOLS="35.0.0"
KOTLIN_VERSION="2.2.0"
AGP_VERSION="8.2.2"
# hbuild 项目路径
PROJECT_PATH="/d/workspace/driver"

# ============================================
# SDK 白名单配置 - 只复制需要的 SDK
# 取消注释 = 启用该功能
# ============================================

# ===== 核心 SDK (必须，不要修改) =====
CORE_SDKS=(
    "uts-runtime-release.aar"
    "android-gif-drawable-1.2.29.aar"
    "app-common-release.aar"
    "app-runtime-release.aar"
    "breakpad-build-release.aar"
    "dcloud-layout-release.aar"
    "framework-release.aar"
    "uni-exit-release.aar"
    "uni-getAccessibilityInfo-release.aar"
    "uni-getAppAuthorizeSetting-release.aar"
    "uni-getAppBaseInfo-release.aar"
    "uni-getSystemSetting-release.aar"
    "uni-openAppAuthorizeSetting-release.aar"
    "uni-prompt-release.aar"
    "uni-storage-release.aar"
    "uni-getDeviceInfo-release.aar"
    "uni-getSystemInfo-release.aar"
    "uni-rpx2px-release.aar"
    "uni-theme-release.aar"
)

# ===== 常用功能 SDK =====
COMMON_SDKS=(
    "uni-modal-release.aar"              # 弹窗
    "uni-actionSheet-release.aar"        # 操作菜单
    "uni-network-release.aar"            # 网络请求
    "uni-websocket-release.aar"          # WebSocket
    "uni-clipboard-release.aar"          # 剪贴板
    "uni-keyboard-release.aar"           # 键盘
    "uni-getNetworkType-release.aar"     # 网络类型
    "uni-makePhoneCall-release.aar"      # 打电话
    "uni-privacy-release.aar"            # 隐私
    "uni-shareWithSystem-release.aar"    # 系统分享
    "uni-installApk-release.aar"         # 安装APK
    "uni-fileSystemManager-release.aar"  # 文件系统
    "uni-arrayBufferToBase64-release.aar"
    "uni-base64ToArrayBuffer-release.aar"
    "uni-createRequestPermissionListener-release.aar"
    "debug-server-release.aar"           # 调试服务
)

# ===== 可选功能 SDK - 取消注释启用 =====
OPTIONAL_SDKS=(
    # --- 媒体功能 ---
    "uni-chooseMedia-release.aar"        # 选择媒体
    "uni-previewImage-release.aar"       # 预览图片
    "uni-media-release.aar"              # 媒体
    "uni-video-release.aar"              # 视频播放
    "videoplayer.aar"                    # 视频播放器
    "ijkplayer.aar"                      # IJK播放器
    # "audio-mp3aac-release.aar"           # 音频编码
    # "uni-createInnerAudioContext-release.aar"  # 音频播放
    # "uni-getBackgroundAudioManager-release.aar" # 后台音频
    # "uni-recorder-release.aar"           # 录音
    
    # --- 相机/扫码 ---
    "uni-camera-release.aar"             # 相机
    "uni-scanCode-release.aar"           # 扫码
    "uni-barcode-scanning-release.aar"   # 条码扫描
    
    # --- WebView ---
    "uni-createWebviewContext-release.aar"  # WebView
    "nativeobj-preview-release.aar"      # 原生预览
    
    # --- Canvas ---
    # "uni-canvas-release.aar"             # Canvas
    # "uni-canvas-component-release.aar"   # Canvas组件
    
    # --- 富文本 ---
    # "uni-rich-text-release.aar"          # 富文本
    
    # --- 打开文档 ---
    # "uni-openDocument-release.aar"       # 打开文档
    
    # --- SSE ---
    # "uni-sse-release.aar"                # Server-Sent Events
    
    # --- 地图/定位 (腾讯) ---
    # "uni-location-release.aar"           # 定位核心
    # "uni-location-system-release.aar"    # 系统定位
    # "uni-location-tencent-release.aar"   # 腾讯定位
    # "uni-map-tencent-release.aar"        # 腾讯地图
    # "uni-chooseLocation-release.aar"     # 选择位置
    
    # --- 支付 ---
    # "uni-payment-release.aar"            # 支付核心
    # "uni-payment-alipay-release.aar"     # 支付宝支付
    # "uni-payment-wxpay-release.aar"      # 微信支付
    # "uni-requestMerchantTransfer-release.aar"
    
    # --- 推送 ---
    # "uni-push-release.aar"               # 推送服务
    
    # --- 一键登录 ---
    # "uni-verify-release.aar"             # 一键登录
    
    # --- 直播 ---
    # "uni-live-player-release.aar"        # 直播播放
    # "uni-live-pusher-release.aar"        # 直播推流
    
    # --- 实人认证 ---
    # "uni-facialVerify-release.aar"
    # "facialRecognitionVerify-support-release.aar"
    # "aliyun-base-2.3.16.1-240418145504.aar"
    # "aliyun-facade-2.3.16.1-240418145504.aar"
    # "aliyun-face-2.3.16.1-240418145504.aar"
    # "aliyun-faceaudio-2.3.16.1-240418145504.aar"
    # "aliyun-facelanguage-2.3.16.1-240418145504.aar"
    # "aliyun-photinus-2.3.16.1-240418145504.aar"
    # "aliyun-wishverify-2.3.16.1-240418145504.aar"
    # "Android-AliyunFaceGuard-10049.aar"
    # "APSecuritySDK-deepSec-7.0.1.20240415.jiagu.aar"
    
    # --- uniCloud ---
    # "uni-cloud-client-release.aar"       # uniCloud客户端
    # "uni-secure-network-release.aar"     # 安全网络
    
    # --- 崩溃收集 ---
    # "uni-crash-release.aar"              # 崩溃收集
    
    # --- 其他 ---
    # "uni-match-media-release.aar"        # 媒体查询
    # "uni-getProvider-release.aar"        # 获取服务商
)

# 检查是否在白名单中
is_in_whitelist() {
    local file="$1"
    for sdk in "${CORE_SDKS[@]}" "${COMMON_SDKS[@]}" "${OPTIONAL_SDKS[@]}"; do
        if [[ "$file" == "$sdk" ]]; then
            return 0  # 在白名单中
        fi
    done
    return 1  # 不在白名单中
}

# 参数检查
PROJECT_NAME=${1:-"UNI5067A0E"}
PACKAGE_NAME=${2:-"uni.app.${PROJECT_NAME}"}
# AppID 格式: __UNI__XXXXXXX
APP_ID="__UNI__${PROJECT_NAME#UNI}"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  uni-app x Android 项目脚手架${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "项目名称: ${YELLOW}$PROJECT_NAME${NC}"
echo -e "包名: ${YELLOW}$PACKAGE_NAME${NC}"
echo -e "AppID: ${YELLOW}$APP_ID${NC}"
echo ""

# 创建项目目录
echo -e "${GREEN}[1/7] 创建项目目录结构...${NC}"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# 包名转路径
PACKAGE_PATH=$(echo $PACKAGE_NAME | tr '.' '/')

# 创建目录结构
mkdir -p app/src/main/java/$PACKAGE_PATH
mkdir -p app/src/main/res/layout
mkdir -p app/src/main/res/values
mkdir -p app/src/main/res/drawable
mkdir -p app/src/main/res/mipmap-hdpi
mkdir -p app/src/main/res/mipmap-mdpi
mkdir -p app/src/main/res/mipmap-xhdpi
mkdir -p app/src/main/res/mipmap-xxhdpi
mkdir -p app/src/main/res/mipmap-xxxhdpi
mkdir -p app/libs
mkdir -p uniappx/src/main/java
mkdir -p uniappx/src/main/res
mkdir -p uniappx/src/main/assets/apps
mkdir -p uniappx/libs
mkdir -p plugins

# 创建默认 app 图标 (使用 XML adaptive icon)
cat > app/src/main/res/mipmap-hdpi/ic_launcher.xml << 'ICON_EOF'
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@drawable/ic_launcher_foreground"/>
</adaptive-icon>
ICON_EOF

# 复制到其他分辨率
cp app/src/main/res/mipmap-hdpi/ic_launcher.xml app/src/main/res/mipmap-mdpi/
cp app/src/main/res/mipmap-hdpi/ic_launcher.xml app/src/main/res/mipmap-xhdpi/
cp app/src/main/res/mipmap-hdpi/ic_launcher.xml app/src/main/res/mipmap-xxhdpi/
cp app/src/main/res/mipmap-hdpi/ic_launcher.xml app/src/main/res/mipmap-xxxhdpi/

# 创建图标背景色
cat > app/src/main/res/values/colors.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_background">#42B983</color>
</resources>
EOF

# 创建图标前景 drawable
cat > app/src/main/res/drawable/ic_launcher_foreground.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="108"
    android:viewportHeight="108">
    <path
        android:fillColor="#FFFFFF"
        android:pathData="M54,54m-30,0a30,30 0,1 1,60 0a30,30 0,1 1,-60 0"/>
</vector>
EOF

echo -e "${GREEN}[2/7] 创建 Gradle 配置文件...${NC}"

# settings.gradle (按官方文档配置)
cat > settings.gradle << EOF
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
        maven { url 'https://jitpack.io' }
        maven { url 'https://maven.pkg.jetbrains.space/kotlin/p/kotlin/dev' }
    }
}
rootProject.name = "$PROJECT_NAME"
include ':app'
include ':uniappx'
EOF

# 根目录 build.gradle (包含 buildscript 配置 gradle 插件)
cat > build.gradle << EOF
buildscript {
    dependencies {
        classpath(files('plugins/uts-kotlin-compiler-plugin-0.0.1.jar'))
        classpath(files('plugins/uts-kotlin-gradle-plugin-0.0.1.jar'))
    }
}

plugins {
    id 'com.android.application' version '$AGP_VERSION' apply false
    id 'com.android.library' version '$AGP_VERSION' apply false
    id 'org.jetbrains.kotlin.android' version '$KOTLIN_VERSION' apply false
}
EOF

# gradle.properties (包含 enableJetifier)
cat > gradle.properties << EOF
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
kotlin.code.style=official
android.nonTransitiveRClass=true
EOF

# app/build.gradle
cat > app/build.gradle << EOF
plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android'
}

android {
    namespace '$PACKAGE_NAME'
    compileSdk $COMPILE_SDK
    buildToolsVersion "$BUILD_TOOLS"

    defaultConfig {
        applicationId "$PACKAGE_NAME"
        minSdk $MIN_SDK
        targetSdk $TARGET_SDK
        versionCode 1
        versionName "1.0"
        
        // 推送等 SDK 需要的占位符
        manifestPlaceholders = [
            "PUSH_APPID": "",
            "GETUI_APPID": "",
            "plus.unipush.appid": "",
            "plus.unipush.appkey": "",
            "plus.unipush.appsecret": "",
            "apk.applicationId": "$PACKAGE_NAME"
        ]
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    
    aaptOptions {
        additionalParameters '--auto-add-overlay'
        ignoreAssetsPattern '!.svn:!.git:.*:!CVS:!thumbs.db:!picasa.ini:!*.scc:*~'
    }
    
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = '17'
    }
}

dependencies {
    implementation project(':uniappx')
    implementation fileTree(dir: '../uniappx/libs', include: ['*.aar'])
    implementation 'androidx.core:core-ktx:1.10.1'
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.9.0'
}
EOF

# uniappx/build.gradle (包含 io.dcloud.uts.kotlin 插件和 aaptOptions)
cat > uniappx/build.gradle << EOF
plugins {
    id 'com.android.library'
    id 'org.jetbrains.kotlin.android'
    id 'io.dcloud.uts.kotlin'
}

android {
    namespace '$PACKAGE_NAME.uniappx'
    compileSdk $COMPILE_SDK
    buildToolsVersion "$BUILD_TOOLS"

    defaultConfig {
        minSdk $MIN_SDK
        targetSdk $TARGET_SDK
    }

    aaptOptions {
        additionalParameters '--auto-add-overlay'
        ignoreAssetsPattern '!.svn:!.git:.*:!CVS:!thumbs.db:!picasa.ini:!*.scc:*~'
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = '17'
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

echo -e "${GREEN}[3/7] 创建 Android 清单文件...${NC}"

# app/src/main/AndroidManifest.xml (添加 tools:replace 解决冲突)
cat > app/src/main/AndroidManifest.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">
    <application
        android:allowBackup="false"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/Theme.AppCompat.Light.NoActionBar"
        tools:replace="android:allowBackup,android:theme,android:label">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF

# uniappx/src/main/AndroidManifest.xml (按官方文档配置)
cat > uniappx/src/main/AndroidManifest.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">
    
    <application
        android:name="io.dcloud.uniapp.UniApplication"
        tools:replace="android:name">
        
        <!-- uni-app x Activity -->
        <activity
            android:name="io.dcloud.uniapp.UniAppActivity"
            android:configChanges="orientation|keyboard|keyboardHidden|smallestScreenSize|screenLayout|screenSize|mcc|mnc|fontScale|navigation|uiMode"
            android:exported="true"
            android:label="@string/app_name"
            android:screenOrientation="portrait"
            android:theme="@style/UniAppX.Activity.DefaultTheme"
            android:windowSoftInputMode="adjustResize"
            tools:replace="android:label,android:exported,android:theme,android:configChanges,android:windowSoftInputMode,android:screenOrientation">
        </activity>
        
        <!-- AppID 配置 -->
        <meta-data
            android:name="DCLOUD_UNI_APPID"
            android:value="$APP_ID" />
        
        <!-- 应用分发渠道 -->
        <meta-data
            android:name="DCLOUD_CHANNEL"
            android:value="default" />
            
    </application>
</manifest>
EOF

# app/src/main/res/values/strings.xml
cat > app/src/main/res/values/strings.xml << EOF
<resources>
    <string name="app_name">$PROJECT_NAME</string>
</resources>
EOF

echo -e "${GREEN}[4/7] 创建 MainActivity...${NC}"

cat > app/src/main/java/$PACKAGE_PATH/MainActivity.kt << EOF
package $PACKAGE_NAME

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.dcloud.uniapp.UniSDKEngine

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 启动 uni-app x
        UniSDKEngine.getUniSDKInstance().launch(this)
    }
}
EOF

echo -e "${GREEN}[5/8] 复制 uni-app x SDK 文件...${NC}"

# 先复制 jar 文件（Kotlin 插件）到 plugins 目录 - 必须在 gradle wrapper 之前！
if [ -d "$PLUGINS_PATH" ]; then
    JAR_COUNT=$(ls -1 "$PLUGINS_PATH"/*.jar 2>/dev/null | wc -l)
    if [ "$JAR_COUNT" -gt 0 ]; then
        cp "$PLUGINS_PATH"/*.jar plugins/
        echo -e "  ✓ 已复制 ${JAR_COUNT} 个 jar 文件到 plugins/"
    fi
fi

# 复制 aar 文件（根据白名单过滤）
SDK_LIBS_PATH="$SDK_PATH/libs"
COPIED_COUNT=0
SKIPPED_COUNT=0

if [ -d "$SDK_LIBS_PATH" ]; then
    for aar in "$SDK_LIBS_PATH"/*.aar; do
        if [ -f "$aar" ]; then
            filename=$(basename "$aar")
            if is_in_whitelist "$filename"; then
                cp "$aar" uniappx/libs/
                COPIED_COUNT=$((COPIED_COUNT + 1))
            else
                SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
            fi
        fi
    done
    echo -e "  ✓ 已复制 ${COPIED_COUNT} 个 aar 文件到 uniappx/libs/"
    echo -e "  ✓ 已跳过 ${SKIPPED_COUNT} 个不需要的 SDK"
else
    echo -e "${YELLOW}  未找到 SDK libs 目录: $SDK_LIBS_PATH${NC}"
fi

echo -e "${GREEN}[6/8] 初始化 Gradle Wrapper...${NC}"
gradle.bat wrapper --gradle-version $GRADLE_VERSION 2>/dev/null || echo -e "${YELLOW}请手动运行: gradle.bat wrapper --gradle-version $GRADLE_VERSION${NC}"

echo -e "${GREEN}[7/8] 复制 HBuilderX 项目资源...${NC}"

# HBuilderX 项目资源路径
HBUILDER_RESOURCES="$PROJECT_PATH/unpackage/resources/app-android"

if [ -d "$HBUILDER_RESOURCES" ]; then
    # 复制资源文件到 assets/apps/
    if [ -d "$HBUILDER_RESOURCES/$APP_ID" ]; then
        cp -r "$HBUILDER_RESOURCES/$APP_ID" uniappx/src/main/assets/apps/
        echo -e "  ✓ 已复制资源到 uniappx/src/main/assets/apps/$APP_ID/"
    else
        # 尝试查找其他 AppID 目录
        FOUND_APPID=$(ls -d "$HBUILDER_RESOURCES"/__UNI__* 2>/dev/null | head -1)
        if [ -n "$FOUND_APPID" ]; then
            cp -r "$FOUND_APPID" uniappx/src/main/assets/apps/
            echo -e "  ✓ 已复制资源: $(basename $FOUND_APPID)"
        else
            echo -e "${YELLOW}  未找到资源目录: $HBUILDER_RESOURCES/$APP_ID${NC}"
        fi
    fi
    
    # 复制 kt 文件到 src/main/java/
    UNIAPPX_SRC="$HBUILDER_RESOURCES/uniappx/app-android/src"
    if [ -d "$UNIAPPX_SRC" ]; then
        cp -r "$UNIAPPX_SRC"/* uniappx/src/main/java/
        echo -e "  ✓ 已复制 kt 文件到 uniappx/src/main/java/"
    else
        echo -e "${YELLOW}  未找到 kt 文件目录: $UNIAPPX_SRC${NC}"
    fi
else
    echo -e "${YELLOW}  未找到 HBuilderX 资源目录: $HBUILDER_RESOURCES${NC}"
    echo -e "${YELLOW}  请先在 HBuilderX 中导出资源：发行 -> 原生App-本地打包 -> 生成本地打包App资源${NC}"
fi

echo -e "${GREEN}[8/8] 创建说明文件...${NC}"

cat > README.md << EOF
# $PROJECT_NAME

基于 uni-app x 原生 SDK 创建的 Android 项目。

## 项目结构

\`\`\`
$PROJECT_NAME/
├── app/                    # 主模块
├── uniappx/               # uni-app x 模块
│   ├── libs/              # SDK aar 文件
│   └── src/main/
│       └── assets/apps/   # uni-app x 资源文件
├── plugins/               # Kotlin 插件 jar 文件
└── gradlew
\`\`\`

## 配置信息

- AppID: \`$APP_ID\`
- 包名: \`$PACKAGE_NAME\`
- Gradle: $GRADLE_VERSION
- AGP: $AGP_VERSION
- Kotlin: $KOTLIN_VERSION
- HBuilderX 项目: \`$PROJECT_PATH\`

## 构建

\`\`\`bash
./gradlew assembleDebug
\`\`\`

## 参考文档

- [uni-app x 原生SDK Android版](https://doc.dcloud.net.cn/uni-app-x/native/use/android.html)
EOF

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  项目创建完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "项目结构:"
echo "  $PROJECT_NAME/"
echo "  ├── app/              (主模块)"
echo "  ├── uniappx/          (uni-app x 模块)"
echo "  │   ├── libs/         (SDK aar 文件)"
echo "  │   └── assets/apps/  (uni-app x 资源)"
echo "  ├── plugins/          (Kotlin 插件)"
echo "  └── README.md"
echo ""
echo -e "${YELLOW}下一步操作:${NC}"
echo "  1. cd $PROJECT_NAME"
echo "  2. ./gradlew assembleDebug"
echo ""