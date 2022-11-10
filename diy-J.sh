#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
num=$(find $CURRENT_DIR -name gradlew  | awk -F"/" '{print NF-1}')
DIR=$(find $CURRENT_DIR -name gradlew  | cut -d \/ -f$num)
cd $CURRENT_DIR/$DIR

#签名
signingConfigs='ICAgIHNpZ25pbmdDb25maWdzIHtcCiAgICAgICAgaWYgKHByb2plY3QuaGFzUHJvcGVydHkoIlJFTEVBU0VfU1RPUkVfRklMRSIpKSB7XAogICAgICAgICAgICBteUNvbmZpZyB7XAogICAgICAgICAgICAgICAgc3RvcmVGaWxlIGZpbGUoUkVMRUFTRV9TVE9SRV9GSUxFKVwKICAgICAgICAgICAgICAgIHN0b3JlUGFzc3dvcmQgUkVMRUFTRV9TVE9SRV9QQVNTV09SRFwKICAgICAgICAgICAgICAgIGtleUFsaWFzIFJFTEVBU0VfS0VZX0FMSUFTXAogICAgICAgICAgICAgICAga2V5UGFzc3dvcmQgUkVMRUFTRV9LRVlfUEFTU1dPUkRcCiAgICAgICAgICAgICAgICB2MVNpZ25pbmdFbmFibGVkIHRydWVcCiAgICAgICAgICAgICAgICB2MlNpZ25pbmdFbmFibGVkIHRydWVcCiAgICAgICAgICAgICAgICBlbmFibGVWM1NpZ25pbmcgPSB0cnVlXAogICAgICAgICAgICAgICAgZW5hYmxlVjRTaWduaW5nID0gdHJ1ZVwKICAgICAgICAgICAgfVwKICAgICAgICB9XAogICAgfVwKXA=='
signingConfig='ICAgICAgICAgICAgaWYgKHByb2plY3QuaGFzUHJvcGVydHkoIlJFTEVBU0VfU1RPUkVfRklMRSIpKSB7XAogICAgICAgICAgICAgICAgc2lnbmluZ0NvbmZpZyBzaWduaW5nQ29uZmlncy5teUNvbmZpZ1wKICAgICAgICAgICAgfVwK'
signingConfigs="$(echo "$signingConfigs" |base64 -d )"
signingConfig="$(echo "$signingConfig" |base64 -d )"
sed -i -e "/defaultConfig {/i\\$signingConfigs " -e "/debug {/a\\$signingConfig " -e "/release {/a\\$signingConfig " $CURRENT_DIR/$DIR/app/build.gradle
cp -f $CURRENT_DIR/DIY/TVBoxOSC.jks $CURRENT_DIR/$DIR/app/TVBoxOSC.jks
cp -f $CURRENT_DIR/DIY/TVBoxOSC.jks $CURRENT_DIR/$DIR/TVBoxOSC.jks
echo "" >>$CURRENT_DIR/$DIR/gradle.properties
echo "RELEASE_STORE_FILE=./TVBoxOSC.jks" >>$CURRENT_DIR/$DIR/gradle.properties
echo "RELEASE_KEY_ALIAS=TVBoxOSC" >>$CURRENT_DIR/$DIR/gradle.properties
echo "RELEASE_STORE_PASSWORD=TVBoxOSC" >>$CURRENT_DIR/$DIR/gradle.properties
echo "RELEASE_KEY_PASSWORD=TVBoxOSC" >>$CURRENT_DIR/$DIR/gradle.properties


  #改自定义功能
sed -i 's/自定义jar加载成功/LionMovies 播放配置加载完成/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/HomeActivity.java
sed -i 's/开源测试软件,请勿商用以及播放违法内容/专业礼品定制，贵金属、纪念钱币、生日钞礼品定制。/g'  $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/LivePlayActivity.java
sed -i 's/暂无节目信息/生日钞——亿万分之一的心意/g'  $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/LivePlayActivity.java
sed -i 's/10000/15000/g'  $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/player/controller/VodController.java

  #更换整个文件
  cp $CURRENT_DIR/DIY/index.html  $CURRENT_DIR/$DIR/app/src/main/res/raw/index.html
  cp $CURRENT_DIR/DIY/strings.xml $CURRENT_DIR/$DIR/app/src/main/res/values/strings.xml
  cp $CURRENT_DIR/DIY/dialog_about.xml   $CURRENT_DIR/$DIR/app/src/main/res/layout/dialog_about.xml  

 cp  $CURRENT_DIR/DIY/colors.xml  $CURRENT_DIR/$DIR/app/src/main/res/values/colors.xml
 cp  $CURRENT_DIR/DIY/shape_player_control_vod_seek.xml $CURRENT_DIR/$DIR/app/src/main/res/drawable/shape_player_control_vod_seek.xml
 
 
#cp -i $CURRENT_DIR/DIY/ModelSettingFragment.java $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/fragment/ModelSettingFragment.java
#cp -i $CURRENT_DIR/DIY/fragment_model.xml     $CURRENT_DIR/$DIR/app/src/main/res/layout/fragment_model.xml
  
#cp -i $CURRENT_DIR/DIY/ToolUtils.java         $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/util/ToolUtils.java
#cp -i $CURRENT_DIR/DIY/RemoteConfigName.java  $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/util/RemoteConfigName.java
#cp -i $CURRENT_DIR/DIY/RemoteConfig.java      $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/util/RemoteConfig.java
#cp -i $CURRENT_DIR/DIY/LOG.java               $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/util/LOG.java
#cp -i $CURRENT_DIR/DIY/FileUtils.java         $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/util/FileUtils.java

#cp -i $CURRENT_DIR/DIY/UpdateDialog.java  $CURRENT_DIR/$DIR/app\src\main\java\com\github\tvbox\osc\ui\dialog\UpdateDialog.java
#cp -i $CURRENT_DIR/DIY/dialog_update.xml  $CURRENT_DIR/$DIR/app/src/main/res/layout/dialog_update.xml  
 
#cp -i CURRENT_DIR/DIY/ApiConfig.java    $CURRENT_DIR/$DIR/app\src\main\java\com\github\tvbox\osc\api\ApiConfig.java
#cp -i $CURRENT_DIR/DIY/App.java          $CURRENT_DIR/$DIR/app\src\main\java\com\github\tvbox\osc\base\App.java
#cp -i $CURRENT_DIR/DIY/HomeActivity.java $CURRENT_DIR/$DIR/app\src\main\java\com\github\tvbox\osc\ui\activity\HomeActivity.java

#取消选集全屏
sed -i 's/if (showPreview \&\& !fullWindows) toggleFullPreview/\/\/if (showPreview \&\& !fullWindows) toggleFullPreview/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
#背景修改
mv $CURRENT_DIR/DIY/app_bg.png $CURRENT_DIR/$DIR/app/src/main/res/drawable/app_bg.png

#图标修改
cp $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/$DIR/app/src/main/res/drawable-hdpi/app_icon.png
cp $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/$DIR/app/src/main/res/drawable-xhdpi/app_icon.png
cp $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/$DIR/app/src/main/res/drawable-xxhdpi/app_icon.png
mv $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/$DIR/app/src/main/res/drawable-xxxhdpi/app_icon.png


echo 'DIY end'
