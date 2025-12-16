## 第一步: 生成本地打包资源
### 在 HBuilderX 中打开你的项目
### 菜单选择: 发行 → 原生App-本地打包 → 生成本地打包App资源
### 等待生成完成,会在项目根目录生成资源:
```text
cdw/
└── unpackage/
    └── resources/
        └── __UNI__xxxx/  (这就是你需要的资源包)
```

## 第二步: 下载 Android 离线 SDK

### 访问 DCloud 官网下载 SDK:
  #### 地址: https://nativesupport.dcloud.net.cn/AppDocs/download/android
  #### 选择与你的 HBuilderX 版本对应的 SDK 版本

### 解压 SDK,目录结构大致如下:
```text
HBuilder-Integrate-AS/
├── app/
├── simpleDemo/
├── UniPlugin-Hello-AS/
└── ...
```

## 第三步: 配置 Android 项目

### 复制资源文件

#### 将第一步生成的 __UNI__xxxx 文件夹复制到:
```
HBuilder-Integrate-AS/
└── simpleDemo/
    └── src/
        └── main/
            └── assets/
                └── apps/
                    └── __UNI__xxxx/  (粘贴到这里)
```

#### 配置 dcloud_control.xml - 打开 simpleDemo/src/main/assets/data/dcloud_control.xml,修改为:
##### 修改应用名称:
```
<application
    android:name="io.dcloud.application.DCloudApplication"
    android:label="app的名字"
    android:icon="@drawable/icon"
    ...>
```

##### 确保已添加你需要的权限(从 manifest.json 复制):

```
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<!-- 等等其他权限 -->

```
#### 配置 build.gradle (app级别) - 打开 simpleDemo/build.gradle:

```
android {
    compileSdkVersion 30
    
    defaultConfig {
        applicationId "com.xxx.app"  // 改成你的包名
        minSdkVersion 21
        targetSdkVersion 30
        versionCode 4490
        versionName "4.4.9"
        
        ndk {
            abiFilters 'armeabi-v7a', 'arm64-v8a', 'x86'
        }
    }
}
```








## 第四步: 集成第三方 SDK - 根据你的配置,需要集成以下 SDK:

### 高德地图
#### 在 build.gradle 添加依赖:
```
dependencies {
    implementation 'com.amap.api:location:latest.integration'
}
```

#### 在 AndroidManifest.xml 添加:

```
<meta-data
    android:name="com.amap.api.v2.apikey"
    android:value="xxxxx"/>
```


### 微信 SDK (登录/支付/分享)
#### 下载微信开放平台 Android SDK

#### 配置 AppID: xxxxx
#### 参考: https://nativesupport.dcloud.net.cn/AppDocs/usemodule/androidModuleConfig/oauth

### 支付宝 SDK
#### 参考: https://nativesupport.dcloud.net.cn/AppDocs/usemodule/androidModuleConfig/pay


## 第五步: 配置应用图标和启动页
### 替换应用图标 将你的图标文件替换到:
```
simpleDemo/src/main/res/
├── drawable-hdpi/icon.png      (72x72)
├── drawable-xhdpi/icon.png     (96x96)
├── drawable-xxhdpi/icon.png    (144x144)
└── drawable-xxxhdpi/icon.png   (192x192)
```

### 配置启动页 - 将你的启动页图片复制到对应目录:
```
simpleDemo/src/main/res/
├── drawable-xhdpi/splash.png
├── drawable-xxhdpi/splash.png
└── drawable-xxxhdpi/splash.png
```

## 第六步: 使用 Android Studio 打包
### 打开项目
#### 启动 Android Studio

#### 打开 HBuilder-Integrate-AS 项目

#### 等待 Gradle 同步完成

### 生成签名文件 (如果还没有)
```
Build → Generate Signed Bundle / APK
→ APK → Create new... 
→ 填写密钥信息 → 生成 .jks 文件
```

### 打包 APK - 生成的 APK 位于: simpleDemo/release/app-release.apk

```
Build → Generate Signed Bundle / APK
→ 选择 APK
→ 选择签名文件
→ 选择 release
→ 勾选 V1 和 V2 签名
→ Finish
```

## 第七步: 测试安装
### 将生成的 APK 安装到手机测试: adb install app-release.apk



## QA
### 资源包找不到: 确保 __UNI__7F8ACB0 文件夹完整复制到 assets/apps/ 目录
### 第三方功能不可用: 检查对应 SDK 是否正确集成和配置
### 白屏/启动失败: 检查 dcloud_control.xml 中的 appid 是否正确
### 打包报错: 检查 SDK 版本是否与 HBuilderX 版本匹配