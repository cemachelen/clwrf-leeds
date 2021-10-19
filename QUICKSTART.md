# Quickstart.md

To quickly run a prebuilt ClWRF executable a few modifications can be made to the standard WRFotron.

1. on arc4
2. `git clone git@github.com:wrfchem-leeds/WRFotron.git`
3. `cp -rp WRFotron ClWRFotron` create a separate folder to work in
4. `git clone git@github.com:cemachelen/clwrf-leeds.git` This a little repo of markdown files and useful template edit files
5. `cp clwrf-leeds/wrfotronedits/config.bash  ` The edits made here are outlined in the file and in the wrfotronedits/README.md in the repo
4.  This method is linked to the [WRFotron Quickstart](https://wrfchem-leeds.github.io/WRFotron/)
5. `cd ClWRFotron`
6. `. /nobackup/cemac/cemac.sh` CEMAC have prebuilt a ClWRF executable
7. `. master.bash 2015 10 12 00 24 06`

Now a very basic 24 hour simulation using ClWRF should be running. To perform some longer simulations we'll need to make some more adjustments in the wrfotron template files
