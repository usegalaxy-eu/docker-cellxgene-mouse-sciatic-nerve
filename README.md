# docker-cellxgene-mouse-sciatic-nerve
Docker image to visualize mouse sciatic nerve data with cellxgene.

This single-nuclei RNAseq data includes the femoral section of the sciatic nerve from mice of different ages. In addition to the first level of clustering, there are second level clustering UMAPS for sciatic nerve macrophages and adipocytes.

# Run the image

You can start the container outside of Galaxy with:

```bash
docker run -i -t --rm -p 8080:8080 -p 8081:8081 -p 8082:8082 https://quay.io/repository/bgruening/cellxgene-mouse-sciatic-nerve  bash
```

Once you are in the container you can start the application with:

```bash
/init
```