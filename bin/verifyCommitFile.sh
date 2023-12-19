#!/usr/bin/env node

ERROR="\033[41;37m ERROR \033[0m"
DONE="\033[42;30m DONE \033[0m"
INFO="\033[44;30m INFO \033[0m"

eslint_path='node_modules/.bin/eslint';

if [[ ! -x $eslint_path ]];
then
    echo 'please npm i eslint';
    exit 1;
fi;

GIT_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E "^src.*\.(js|vue)$");

for i in $GIT_FILES;
do 
    $eslint_path $i --quiet;
    if [[ $? == 0 ]];
    then
        echo "$INFO \033[32m检查通过 $i\033[0m"
    else
        echo "$ERROR \033[31m提交失败\033[0m"
        exit 1;
    fi;
done;


