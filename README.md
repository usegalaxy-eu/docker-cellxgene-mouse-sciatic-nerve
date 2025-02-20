# docker-cellxgene-mouse-sciatic-nerve
Docker image to visualize mouse sciatic nerve data with cellxgene.

This single-nuclei RNAseq data includes the femoral section of the sciatic nerve from mice of different ages. In addition to the first level of clustering, there are second level clustering UMAPS for sciatic nerve macrophages and adipocytes.

# Run the image

You can start the container outside of Galaxy with:

```bash
docker run --init -it --rm -p 8080:8080 -p 8081:8081 -p 8082:8082 quay.io/bgruening/cellxgene-mouse-sciatic-nerve:1.2.0
```

Once the container started, you can acces data via http://0.0.0.0:8080, http://0.0.0.0:8081, http://0.0.0.0:8082 in your browser
