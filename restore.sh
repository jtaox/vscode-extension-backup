function read_from_file {
  if [ -f ./backup_repo/backup ]
  then
    echo $(cat ./backup_repo/backup)
  else 
    return 1
  fi
}

function install_vsc_ext {
  for ex in $1
  do
    exName=(${ex//./ }); exName=${exName[1]}
    echo "开始安装${exName}"
    code --install-extension $ex
    echo "${exName}安装完成"
  done
}

readResult=$(read_from_file)

if [ "$readResult" != 1 ]
then
  install_vsc_ext "$readResult"
else 
  echo "未读取到备份文件，请先执行备份操作"
fi