#!/usr/bin/env sh

DONE="\033[42;30m DONE \033[0m"

msg=$(cat .git/COMMIT_EDITMSG)

commitRE='^(merge|feat|fix|docs|styl|style|refactor|test|chore|revert):\s*[^\s].{3,}$'
commitRE='^(merge|feat|fix|docs|styl|style|refactor|test|chore|revert):\s*[^\s].{3,}$'

if echo "$msg" | grep -qE "$commitRE"; 
then
    echo "$DONE commit信息校验成功";
    source $(pwd)/bin/verifyCommitFile.sh;
else 
    echo "commit message不符合规范。请修改为符合规范后再次提交。\n规则：<type>: <subject>\nsubject至少为4个字符（空格不参与），且不可为纯数字"
    exit 1;
fi;