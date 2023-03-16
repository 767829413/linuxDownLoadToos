# The linux script for downloading using wget

脚本中，选项 `-d`，用于指定最大下载任务数量。`download_count`是一个下载任务数量计数器 ，并在每个文件下载后更新它。如果下载任务数量达到用户指定的最大值，则使用 `break` 语句停止循环并退出脚本。

创建一个名为 `file_list.txt` 的文件，并将要下载的文件地址逐行写入该文件中。确保每个文件地址只包含一行。

```
chmod +x download.sh
./download.sh -n 3 -d 5 -f file_list.txt
```

该脚本将在当前目录中下载所有指定的文件，并使用 `-n`、`-d` 和 `-f` 选项指定了并发进程数量、最大下载任务数量和文件地址列表的文件名。如果未指定选项，则使用默认值。# linuxDownLoadToos
