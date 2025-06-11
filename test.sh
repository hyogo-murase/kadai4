#!/bin/bash
#script.shのテスト
tmp=/tmp/$$

ERROR_EXIT(){
        echo $1 1>&2
        rm -f /tmp/3465993--*
        exit 1
}

#test1 入力が足りないとき
echo "input 2 arguments" > $tmp-ans
./script.sh 2> $tmp-result && ERROR_EXIT "1-1: execution error"
diff $tmp-ans $tmp-result || ERROR_EXIT "1-1: message is diff" 
echo "test1-1 passed"


if [ "${ans}" = "${result}" ]; then
echo "test1-1 ok"
else
EXIT "test1-1 ok"
fi

#入力が多いとき
ans="erro: 引数が多い"
result=$(./script.sh 1 2 3)

#一致した場合
ans="equal"

#一致しなかった場合
ans="not equal"

rm -f /tmp/3465993--*
