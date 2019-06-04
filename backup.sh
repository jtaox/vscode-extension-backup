# 获取已安装的扩展
function get_exts_from_vsc {
  list=$(code --list-extensions)
  echo $list
}

function backup_ext_to_git {
  local cur=$(pwd)
  local backup_repo='./backup_repo'
  if [ -d $backup_repo ]
  then 
    cd $backup_repo
    echo $1 > backup
  else
    return 1
  fi

}


function commit_to_git {
  if [ -f ./backup ]
  then
    git add .
    git commit -m "update"
    git push origin master
    echo "提交git成功"
  else 
    echo "没找到备份文件"
  fi
}

exts=$(get_exts_from_vsc)
echo "已安装扩展：$exts"

backup_ext_to_git "$exts"
if [ $? -eq 0 ]
then
  echo "保存成功"
  # commit_to_git
else
  echo "保存失败，未找到目录"
fi