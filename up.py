import os
import subprocess
from datetime import datetime

def git_auto_commit_push(commit_message=None, branch='master'):
    try:
        # 获取当前工作目录
        repo_path = os.getcwd()
        print(f"当前仓库路径: {repo_path}")

        # 检查是否是Git仓库
        if not os.path.isdir(os.path.join(repo_path, '.git')):
            raise Exception("当前目录不是Git仓库")

        # 执行git add .
        print("执行 git add .")
        subprocess.run(['git', 'add', '.'], check=True)

        # 设置默认提交信息
        if not commit_message:
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            commit_message = f"自动提交于 {now}"

        # 执行git commit
        print(f"执行 git commit -m '{commit_message}'")
        subprocess.run(['git', 'commit', '-m', commit_message], check=True)

        # 执行git push
        print(f"执行 git push -u origin {branch}")
        subprocess.run(['git', 'push', '-u', 'origin', branch], check=True)

        print("所有操作成功完成！")

    except subprocess.CalledProcessError as e:
        print(f"执行Git命令时出错: {e}")
    except Exception as e:
        print(f"发生错误: {e}")

if __name__ == "__main__":
    # 可以自定义提交消息，如果留空则使用自动生成的消息
    custom_message = "提交本地更改"  # 设置为None则使用自动消息

    # 也可以指定分支，默认为master
    branch_name = 'master'

    git_auto_commit_push(commit_message=custom_message, branch=branch_name)