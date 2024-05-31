# ベースイメージとして公式のPythonイメージを使用
FROM python:3.8

# 作業ディレクトリを設定
WORKDIR /app

# wait-for-it.sh スクリプトをコンテナにコピー
COPY wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/wait-for-it.sh

# 依存関係をコピーし、インストール
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトのコードをコピー
COPY . /app/

# Djangoの管理コマンドを実行するためのエントリーポイントを設定
CMD ["python", "manage.py", "runserver", "0.0.0.0:8083"]

