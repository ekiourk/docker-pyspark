FROM java:8

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-2.5.0-Linux-x86_64.sh && \
    /bin/bash /Anaconda2-2.5.0-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda2-2.5.0-Linux-x86_64.sh

RUN curl -L http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz | tar xz

RUN mv spark-* spark

WORKDIR spark

ENV PATH /opt/conda/bin:/spark/bin:$PATH

ENV PYSPARK_DRIVER_PYTHON ipython

CMD sh -c "pyspark --packages com.databricks:spark-csv_2.11:1.2.0"
