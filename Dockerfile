FROM cgr.dev/chainguard/python:latest-dev AS buildando
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=buildando /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages
COPY app.py .
COPY templates templates/
COPY static static/

ENTRYPOINT ["flask", "run", "--host=.0.0.0"]
