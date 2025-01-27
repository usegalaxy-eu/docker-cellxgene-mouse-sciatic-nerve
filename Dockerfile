FROM quay.io/biocontainers/cellxgene:1.1.1--pyhdfd78af_0

LABEL org.opencontainers.image.authors="Amirhossein"

RUN mkdir /data && \
    chmod 777 /data

ADD https://zenodo.org/records/14743353/files/all_final_population.h5ad /data/all_final_population.h5ad
ADD https://zenodo.org/records/14743353/files/adipo.h5ad /data/adipo.h5ad
ADD https://zenodo.org/records/14743353/files/macro.h5ad /data/macro.h5ad

# Expose different ports for different datasets
EXPOSE 8080 8081 8082

# Command to launch multiple instances
CMD ["sh", "-c", \
    "cellxgene launch --host 0.0.0.0 --port 8080 /data/all_final_population.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8081 /data/adipo.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8082 /data/macro.h5ad & \
     wait"]