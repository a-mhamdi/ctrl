FROM ubuntu:latest

EXPOSE 1234

RUN apt-get update \
	&& apt-get install -y apt-utils nano vim \
	&& apt-get install -y python3 python3-pip

RUN python3 -m pip install jupyterlab ipython numpy matplotlib scipy pandas control

RUN useradd --create-home --shell /bin/bash ctrl \
	&& chown -R ctrl /home/ctrl

USER ctrl

WORKDIR /home/ctrl/repo

RUN mkdir repo \
	&& cd repo

CMD jupyter notebook --NotebookApp.token='' --ip 0.0.0.0 --port 1234 --allow-root --no-browser

