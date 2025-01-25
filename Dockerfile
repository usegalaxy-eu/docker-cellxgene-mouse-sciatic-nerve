FROM quay.io/biocontainers/cellxgene:1.1.1--pyhdfd78af_0

MAINTAINER Amirhossein

RUN mkdir /data && \
    chmod 777 /data

ADD all_final_real_population.h5ad /data/all_final_real_population.h5ad
ADD adipo.h5ad /data/adipo.h5ad
ADD ZenodoURL.org/bla/macro.h5ad /data/macro.h5ad

# cellxgene launch /data/all_final_real_population.h5ad
CMD ["cellxgene", "launch", "/data/all_final_real_population.h5ad"]
