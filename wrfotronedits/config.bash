#!/bin/bash
# ------------------------------------------------------------------------------
# WRFOTRON
# ------------------------------------------------------------------------------
# code
# ------------------------------------------------------------------------------

# Load in the compilers and openmpi and netcdf libaries and job sechulder
module load intel/19.0.4 openmpi/3.1.4 netcdf/4.6.3 sge
## Load in the version of WRF you want to use
module load ClWRFchem/4.2
# load in a bunch of tools require for pre and postprocessing
module load ncl/6.5.0 nco/4.6.0 wrfchemconda/3.7

version=2.1
projectTag=ClWRFChem4.2_test
withChemistry=true

# WRFotron directory
## Set this to your working copy of WRFotron this is going to pick up your edits to config.bash etc
chainDir=/nobackup/${USER}/ClWRFotron

# These directory paths do not need editing for different compiled versions of
# WRFChem as they just host run time files not executables
# -----------------------------------------------------------------------------

# WPS - this points to a load of files to be copied over not the executables
WPSdir=/nobackup/WRFChem/WPS4.2

# WRFChem - this points to a load of files to be copied over not the executables
WRFdir=/nobackup/WRFChem/WRFChem4.2

# WRFMeteo - this points to a load of files to be copied over not the executables
WRFmeteodir=/nobackup/WRFChem/WRFMeteo4.2

# ------------------------------------------------------------------------------
# preprocessors -
# ------------------------------------------------------------------------------
# MEGAN - this points to a load of files to be copied over not the executables
WRFMEGANdir=/nobackup/WRFChem/megan

# MOZBC - this points to a load of files to be copied over not the executables
WRFMOZARTdir=/nobackup/WRFChem/mozbc

# WESLEY/EXOCOLDENS - this points to a load of files to be copied over not the executables
WRFmztoolsdir=/nobackup/WRFChem/wes-coldens

# ANTHRO_EMISS - this points to a load of files to be copied over not the executables
WRFanthrodir=/nobackup/WRFChem/anthro_emis

# FIRE_EMISS - this points to a load of files to be copied over not the executables
WRFfiredir=/nobackup/WRFChem/finn/src

# ------------------------------------------------------------------------------
# input data
# ------------------------------------------------------------------------------

# initial and boundary meteorological data
metDir=/nobackup/WRFChem/initial_boundary_meteo_ecmwf
metInc=6

# initial and boundary chemistry data (MZ4/CAM-Chem pre 2018, WACCM post 2018)
MOZARTdir=/nobackup/WRFChem/initial_boundary_chem_mz4

# geography data
geogDir=/nobackup/WRFChem/WPSGeog4
landuseDir=modis_landuse_21class_30s/

# MEGAN input data
MEGANdir=/nobackup/WRFChem/emissions/MEGAN

# anthropogenic emissions - data
emissDir=/nobackup/WRFChem/emissions/EDGAR-HTAP2_MEIC2015/MOZART

# anthropogenic emissions - input namelist
emissInpFile=emis_edgarhtap2-meic2015_mozmos.inp

# anthropogenic emissions - year the emissions are valid for (for offset calculation)
emissYear=2010

# fire emissions from FINN (requires a / at the end)
fireDir=/nobackup/WRFChem/emissions/FINN/

# FINN fire emissions input file
fireInpFile=fire_emis.mozm.inp

# diurnal cycle code
WRFemitdir=/nobackup/WRFChem/WRF_UoM_EMIT

# ------------------------------------------------------------------------------
# simulation directories (will not need likely need editing)
# ------------------------------------------------------------------------------
# run folder
workDir=/nobackup/${USER}/${projectTag}/run

# output folder
archiveRootDir=/nobackup/${USER}/${projectTag}/output

# restart folder
restartRootDir=/nobackup/${USER}/${projectTag}/restart

# remove run directory after run is finished?
removeRunDir=false

# post processing script
pyPpScript=${chainDir}/postprocessing.py

# ------------------------------------------------------------------------------
# HPC settings check the size of your simulation! is this over kill?
# ------------------------------------------------------------------------------
# number of cores to run with for each stage
nprocPre=1
nprocMain=128
nprocPost=4

# mpirun for real.exe and wrf.exe
mpiCommandPre=mpirun
mpiCommandMain=mpirun
submitCommand=qsub
usequeue=true

# ------------------------------------------------------------------------------
# misc.
# ------------------------------------------------------------------------------
function msg {
  echo ""
  echo "---"
  echo $1
  echo "---"
  echo ""
}
