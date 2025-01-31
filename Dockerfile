FROM quay.io/biocontainers/cellxgene:1.1.1--pyhdfd78af_0

LABEL org.opencontainers.image.authors="Amirhossein"

RUN mkdir /data && \
    chmod 777 /data

ADD https://zenodo.org/records/14781310/files/all_final.h5ad /data/all.h5ad
ADD https://zenodo.org/records/14781310/files/adipo_final.h5ad /data/adipo.h5ad
ADD https://zenodo.org/records/14781310/files/macro_final.h5ad /data/macro.h5ad

# Expose different ports for different datasets
EXPOSE 8080 8081 8082

# Command to launch multiple instances
CMD ["sh", "-c", \
    "cellxgene launch --host 0.0.0.0 --port 8080 --title mouse_sciatic_nerve --user-generated-data-dir annotation_files /data/all.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8081 --title mouse_sciatic_nerve_adipocytes --user-generated-data-dir annotation_files_adipo /data/adipo.h5ad & \
     cellxgene launch --host 0.0.0.0 --port 8082 --title mouse_sciatic_nerve_macrophages --user-generated-data-dir annotation_files_macro /data/macro.h5ad & \
     wait"]