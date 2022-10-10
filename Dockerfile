FROM --platform=${BUILDPLATFORM} python:3.6.9

EXPOSE 1234

RUN useradd --create-home --shell /bin/bash ctrl \
	&& chown -R ctrl /home/ctrl

USER ctrl

RUN echo "cd /home/ctrl \
	&& mkdir -p vrt-env/pyctrl \
	&& python3 -m venv vrt-env/pyctrl"
	
ENV PATH="$PATH:/home/ctrl/.local/bin"
	
RUN python3 -m pip install numpy matplotlib scipy control ipython jupyter notebook

RUN mkdir /home/ctrl/repo

WORKDIR /home/ctrl/repo

CMD jupyter notebook --NotebookApp.token='' --ip 0.0.0.0 --port 1234 --allow-root --no-browser

