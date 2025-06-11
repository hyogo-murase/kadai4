#!/bin/bash

# テスト失敗時の処理
error_exit() {
    echo "$1は失敗しました" >&2
    exit 1
}

# テスト1: 正常ver（2と4 → 2）
output=$(./saidaikouyakusu.sh 2 4)
if [ "$output" != "2" ]; then
    error_exit "Test1 failed: 2と4の最大公約数が2と出力されない"
else
    echo "テスト1（2と4 → 2）は成功しました"
fi

# テスト2: 引数1つver(エラー)
./saidaikouyakusu.sh 3 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    error_exit "Test2 failed: 引数が1つでもエラーが出力されない"
else
    echo "テスト2（引数1つ → エラー出力）は成功しました"
fi

# テスト3: 引数なしver(エラー)
./saidaikouyakusu.sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
    error_exit "Test3 failed: 引数なしでエラーが出力されない"
else
    echo "テスト3（引数なし → エラー出力）は成功しました"
fi

# テスト4: 文字列入力ver(エラー)
./saidaikouyakusu.sh a b > /dev/null 2>&1
if [ $? -eq 0 ]; then
    error_exit "Test4 failed: 文字列入力でエラーが出力されない"
else
    echo "テスト4（文字列入力ver → エラー出力）は成功しました"
fi

# テスト5: 0 ver(エラー)
./saidaikouyakusu.sh 0 10 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    error_exit "Test5 failed: 0を含む入力でエラーが出力されない"
else
    echo "テスト5（ 0を含む入力 → エラー出力）は成功しました"
fi

echo "すべてのテストは成功しました！"

