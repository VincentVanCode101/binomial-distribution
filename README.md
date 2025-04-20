# Binomial plotting

## First time use
```bash
cd binomial-distribution
docker compose up
docker exec -it binomial-distribution-r-env-1 bash
./make install-package
./make run main.R
```
- enjoy the Rplots.pdf :)
## Second, faster way to execute the main.R to get the pdf
```bash
./get_new_plot
```
(this will start the container, connect to it, install the packages.txt, execute the main.R & kill the container)

### Personel Ponderings
- my first contact with r...
    - as off now: not very pleasent (mostly getting this thing rolling...)
        - getting this into docker
        - installing R nonetheless (for the language server (ノ ゜Д゜)ノ ︵ ┻━┻)
            - the LSP still does not auto-load my .lintr.R config 
            - <img src="./dog_in_fire.jpg" alt="dog_in_fire" width="300"/>
        - connecting vscode to the R-server
- anyways:
    - after 2 hours I am grooving with this setup
