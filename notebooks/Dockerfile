FROM ubuntu:18.04
RUN apt-get update && apt-get install -y build-essential=12.8 python=3.7.0 pip=20.2.2 --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN mkdir /src
WORKDIR /src/
COPY . .
RUN pip install -r requirements.txt
WORKDIR /src/notebooks
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
