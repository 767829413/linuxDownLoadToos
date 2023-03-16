#!/bin/bash

# 设置默认参数
max_processes=3
max_downloads=5
file_list="file_list.txt"

# 解析命令行选项
while getopts "n:d:f:" opt; do
  case $opt in
    n)
      max_processes="$OPTARG"
      ;;
    d)
      max_downloads="$OPTARG"
      ;;
    f)
      file_list="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# 将文件地址列表分成多个文件
split -n "l/$max_processes" "$file_list" "file_list_"

# 下载任务数量计数器
download_count=0

# 循环下载每个文件
for file in file_list_*
do
    cat "$file" | xargs -n 1 -P "$max_processes" wget
    rm -f "$file"
    # 更新下载任务数量计数器
    download_count=$((download_count + $(wc -l < "$file"))))
    if [ $download_count -ge $max_downloads ]; then
        break
    fi
done