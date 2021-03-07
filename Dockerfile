FROM python:3.6
RUN apt-get update && apt-get -y install cron vim
WORKDIR /app

# Adds the cron definition to the cron folder
COPY crontab /etc/cron.d/crontab
# Copies the file into the app folder inside our docker
COPY math_script.py /app/math_script.py

# Gives the permition required to run the cron
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# the cron config is the main application on this container
CMD ["cron", "-f"]


