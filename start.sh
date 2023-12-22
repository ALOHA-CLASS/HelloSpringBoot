#!/bin/bash

# 변수 선언 (=) 앞뒤로 공백❌
PROJECT_NAME=hello-application
WORKSPACE=/home/joeun/workspace
REPOSITORY=/home/joeun/workspace/HelloSpringBoot
DEPLOY_PATH=/home/joeun/workspace/HelloSpringBoot/build/libs

# 프로젝트 경로로 이동
echo "> ${REPOSITORY} 로 이동"
cd $REPOSITORY

# GIT PULL 진행
echo "> GIT PULL"
if git pull; then
  echo "> git pull 성공"
else
  echo "> git pull 실패"
  exit 1
fi

# 빌드 시작
echo "> gradle clean build"
./gradlew clean build 

# 현재 실행 중인 서버 pid(프로세스 아이디) 확인
CURRENT_PID=$(pgrep -f "${PROJECT_NAME}.war")

echo "> 현재 실행 중인 서버 pid : ${CURRENT_PID}"

# 실행 중인 서버 있는지 확인
if [ -z "$CURRENT_PID" ]; then
  echo "> 현재 실행 중인 서버 없음"
else
  echo "> 현재 실행 중인 서버 종료"
  kill -15 $CURRENT_PID
  sleep 5
fi

# 애플리케이션 재배포
echo "> 새로운 애플리케이션 배포"
cd $DEPLOY_PATH

nohup java -jar "${PROJECT_NAME}.war" &

