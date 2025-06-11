#!/bin/bash
#script.shのテスト

EXIT(){
        echo $1 1>&2
        exit 1
}

#test1 入力が足りないとき
ans="error: 引数が多い"
result=$(./script.sh)
[ $ans = $result ] && echo "test1-1 ok" || EXIT "test 1-1"

result=$(./script.sh 1)
[ $ans = $result ] && echo "test1-1 ok" || EXIT "test 1-2"

#入力が多いとき
ans="error: 引数が多い"
result=$(./script.sh 1 2 3)

#一致した場合
ans="equal"
#一致しなかった場合
ans="not equal"
