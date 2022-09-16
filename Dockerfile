FROM ubuntu:latest
EXPOSE 1234
RUN apt-get update \
	&& apt-get install -y apt-utils nano vim
RUN apt-get install -y python3 python3-pip

# RUN python3 -m venv /opt/venv
### Make sure we use the virtualenv:
# ENV PATH="/opt/venv/bin:$PATH"

### """ NOT WORKING """ ###
# ENV PATH=$PATH:$HOME/.local/bin
# RUN echo "export PATH=\"$PATH:$HOME/.local/bin\"" >> .bashrc
# RUN source .bashrc

RUN python3 -m pip install jupyterlab ipython numpy matplotlib scipy pandas
RUN python3 -m pip install control

RUN useradd --create-home --shell /bin/bash ctrl

RUN mkdir repo/
WORKDIR /home/ctrl/repo

# USER ctrl

CMD jupyter notebook --NotebookApp.token='' --ip 0.0.0.0 --port 1234 --allow-root --no-browser

### CMD IPYTHON
# CMD python3 -m IPython

### BUILD
# docker build -t pyctrl:latest .

### PUSH
# docker push abmhamdi/pyctrl:1.0

