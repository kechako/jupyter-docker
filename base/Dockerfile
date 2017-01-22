FROM continuumio/anaconda:latest
MAINTAINER Tomato Ketchup <r@554.jp>

RUN opt/conda/bin/conda install jupyter -y --quiet \
    && mkdir /opt/notebooks

# Set settings to run
VOLUME ["/opt/notebooks"]
EXPOSE 8888
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
