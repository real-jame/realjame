Remove-Item .\build -Recurse
Remove-Item .\build.7z
New-Item -ItemType Directory -Path .\build
hugo -t main --destination ./build/main
hugo -t simple --destination ./build/simple
7z a build.7z .\build
ssh jame@rainpool "rm -rfv /home/jame/build && rm build.7z;"
scp build.7z jame@rainpool:/home/jame
ssh jame@rainpool "7za x build.7z && rm -rfv /home/jame/realjame/* && cp -rv /home/jame/build/* /home/jame/realjame && chmod -R 755 /home/jame/realjame && chown -R jame:web /home/jame/realjame"