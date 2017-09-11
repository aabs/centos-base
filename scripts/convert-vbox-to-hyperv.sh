#!/bin/bash -eux

NOW=$(date +%Y-%m-%d)
BUILDDIR=builds
BOXFILE=virtualbox-centos7.box
VHDFILE=hyperv-centos7.vhd
HVFILE=$VHDFILE.$NOW.tar.gz
OUTDIR=vmdktmp
pushd .

cd $BUILDDIR/

if [ -e $BOXFILE ]; then
  # the vbox file is actually in a legacy format for use by vagrant, the file format is gzipped tar file
  mkdir $OUTDIR
  tar xzf $BOXFILE -C $OUTDIR
  cd $OUTDIR

  # Now we have unpacked the VMDK file we can use virtualbox to convert to hyper-v compatible VHD format
  VBoxManage clonehd packer-centos-7-x86_64-disk001.vmdk $VHDFILE --format vhd

  # move the converted file up to the $BUILDDIR dir and clean up the temp files
  mv $VHDFILE ..
  cd ..
  tar czvf $HVFILE $VHDFILE
  rm -rf $OUTDIR
fi

popd
