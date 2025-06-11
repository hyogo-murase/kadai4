#!/bin/bash

# エラー終了関数
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# 引数が2つかチェック
if [ $# -ne 2 ]; then
    error_exit "2つの自然数を指定してください"
fi

# 自然数かチェック
for suuji in "$1" "$2"; do
if ! [[ $suuji =~ ^[1-9][0-9]*$ ]]; then
error_exit "自然数を入力してください（0や負の数・文字は不可）"
fi
done

# 最大公約数をユークリッドの計算方法で求める
ugr() {
    a=$1
    b=$2

# aの数字が小さければbと入れ替える
    if [ "$a" -lt "$b" ]; then
        temp=$a
        a=$b
        b=$temp
    fi

 # 余りを使って割っていく
    while [ "$b" -ne 0 ]; do
        r=$((a % b))
        a=$b
        b=$r
    done
    echo "$a"
}

# 実行
ugr "$1" "$2"

