FROM ucsdets/scipy-ml-notebook

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y default-jre && \
    apt-get install -y default-jdk


ENV APK_SCRIPT https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
ENV APK_JAR https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.1.jar

RUN mkdir -p /usr/local/bin

RUN P=/tmp/$(basename $APK_SCRIPT) && \
    curl -s -o $P $APK_SCRIPT && \
    chmod +x $P && \
    mv $P /usr/local/bin

RUN P=/tmp/$(basename $APK_JAR) && \
    curl -s -o $P $APK_JAR && \
    chmod +x $P && \
    mv $P /usr/local/bin/apktool.jar
    
