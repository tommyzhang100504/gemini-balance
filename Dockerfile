FROM python:3.10-slim

WORKDIR /app

# 复制所需文件到容器中
COPY ./requirements.txt /app
COPY ./VERSION /app

RUN pip install --no-cache-dir -r requirements.txt
COPY ./app /app/app

# 在构建时以root身份创建应用所需的data目录，并开放写入权限
RUN mkdir data && chmod 777 data

# Expose port
EXPOSE 7860

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860", "--no-access-log"]
