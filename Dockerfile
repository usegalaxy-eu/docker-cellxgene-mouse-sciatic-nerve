FROM quay.io/biocontainers/cellxgene:1.1.1--pyhdfd78af_0

LABEL org.opencontainers.image.authors="Amirhossein"

# Add files from private Zenodo with an API token
RUN --mount=type=secret,id=zenodo_token,env=zenodo_token \
    mkdir /data && \
    chmod 777 /data && \
    curl -v -H "Authorization: Bearer ${zenodo_token}" -o /data/all_final_population.h5ad https://zenodo.org/api/records/14743353/files/all_final_population.h5ad/content && \
    curl -v -H "Authorization: Bearer ${zenodo_token}" -o /data/adipo.h5ad https://zenodo.org/api/records/14743353/files/adipo.h5ad/content && \
    curl -v -H "Authorization: Bearer ${zenodo_token}" -o /data/macro.h5ad https://zenodo.org/api/records/14743353/files/macro.h5ad/content

# Expose different ports for different datasets
EXPOSE 8080 8081 8082

# Command to launch multiple instances
CMD ["sh", "-c", \
    "cellxgene launch --host 0.0.0.0 --port 8080 /data/all_final_population.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8081 /data/adipo.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8082 /data/macro.h5ad & \
     wait"]