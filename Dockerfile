FROM python:3.11 as development

COPY dependencies.txt ./dependencies.txt

WORKDIR /app

COPY . .

RUN pip install -r dependencies.txt
RUN chmod +x start.sh
COPY start.sh /start.sh
ENTRYPOINT ["/bin/sh", "/start.sh"]

CMD ["./start.sh"]

FROM python:3.11-slim as production

COPY dependencies.txt ./dependencies.txt

WORKDIR /app

COPY . .

RUN pip install -r dependencies.txt
RUN chmod +x start.sh
COPY start.sh /start.sh

# Use an explicit command to run the script
ENTRYPOINT ["/bin/sh", "/start.sh"]

CMD ["./start.sh"]