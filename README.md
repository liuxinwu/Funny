# funny

**"风趣娱乐" 是一款以丰富休闲生活为主的 APP，主打免费视频、音频。助您在成功的路上留下一份喜悦。**

# 坑点
    - Cannot run with sound null safety, because the following dependencies don't support null safety （空安全）
        > https://dart.dev/null-safety/unsound-null-safety
        > Andriod Studio -> Run -> Edit Config... -> Flutter -> main.dart -> Additional run args  "--no-sound-null-safety"
