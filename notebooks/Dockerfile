FROM ubuntu:18.04
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential=12.8 python=3.7.0 pip=20.2.2 --no-install-recommends
RUN pip -q install pip --upgrade
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir $HOME/src
WORKDIR $HOME/src/
COPY . .
RUN pip install -r requirements.txt
WORKDIR $HOME/src/notebooks
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
