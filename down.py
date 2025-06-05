import subprocess
import os

def git_pull(repo_path):
    try:
        # 切换到仓库目录
        os.chdir(repo_path)

        # 执行 git pull origin master
        result = subprocess.run(
            ["git", "pull", "origin", "master"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        # 输出结果
        print("Git pull 成功执行:")
        print(result.stdout)

        if "Already up to date" in result.stdout:
            print("仓库已经是最新的，无需更新")
        else:
            print("仓库已更新")

        return True

    except subprocess.CalledProcessError as e:
        print("Git pull 执行失败:")
        print(f"错误信息: {e.stderr}")
        return False
    except Exception as e:
        print(f"发生意外错误: {str(e)}")
        return False

# 使用示例
if __name__ == "__main__":
    # 替换为你的仓库路径
    repository_path = r"D:\pythonProject7\pythonProject1\05\弱密码\dwj_first"

    print(f"正在尝试从 {repository_path} 拉取更新...")
    success = git_pull(repository_path)

    if success:
        print("操作成功完成")
    else:
        print("操作失败")