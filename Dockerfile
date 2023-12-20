FROM jenkins/jenkins:lts-jdk17

USER root

# 必要なツールをインストール（例：git, curl）
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Docker CLIをインストール（JenkinsからDockerコマンドを使えるようにするため）
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

# Jenkinsユーザーに戻る
USER jenkins

# Jenkinsの初期設定スクリプトやプラグインなどをコピーする場合はここに追記
# COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# ポート8080を公開
EXPOSE 8080

# Jenkinsを起動
ENTRYPOINT ["jenkins.sh"]