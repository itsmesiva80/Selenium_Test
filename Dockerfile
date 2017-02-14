FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y python-pip python-dev gcc phantomjs firefox xvfb dbus chromium-chromedriver
RUN pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-xvfb
RUN pip install robotframework-selenium2library
RUN pip install selenium
RUN python --version

ADD xvfb_init /etc/init.d/xvfd
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

#RUN git clone https://github.com/itsmesiva80/Selenium_Test.git
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
