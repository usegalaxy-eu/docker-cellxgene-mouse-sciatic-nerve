FROM quay.io/biocontainers/cellxgene:1.1.1--pyhdfd78af_0

MAINTAINER Amirhossein

RUN mkdir /data && \
    chmod 777 /data

ADD https://zenodo.org/records/14743353/files/all_final_population.h5ad /data/all_final_population.h5ad
ADD https://zenodo.org/records/14743353/files/adipo.h5ad /data/adipo.h5ad
ADD https://zenodo.org/records/14743353/files/macro.h5ad /data/macro.h5ad

# cellxgene launch /data/all_final_population.h5ad
CMD ["cellxgene", "launch", "/data/all_final_population.h5ad"]


# cellxgene launch /data/all_final_real_population.h5ad
CMD ["cellxgene", "launch", "/data/all_final_real_population.h5ad"]
