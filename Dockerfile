FROM python:latest

EXPOSE 1234

RUN useradd --create-home --shell /bin/bash ctrl \
	&& chown -R ctrl /home/ctrl

USER ctrl

RUN cd /home/ctrl \
	&& mkdir -p vrt-env/pyctrl \
	&& python3 -m venv vrt-env/pyctrl
	
ENV PATH="$PATH:/home/ctrl/vrt-env/pyctrl/bin:/home/ctrl/.local/bin"
	
RUN pip3 install numpy matplotlib scipy control ipython jupyter notebook

RUN mkdir repo && cd repo

WORKDIR /home/ctrl/repo

CMD jupyter notebook --NotebookApp.token='' --ip 0.0.0.0 --port 1234 --allow-root --no-browser

