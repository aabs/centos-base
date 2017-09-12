$NOW=Get-Date -Format yyyyMMdd
$BUILDDIR=builds
$BOXFILE=virtualbox-centos7.box
$VHDFILE=hyperv-centos7.vhd
$HVFILE="$VHDFILE.$NOW.zip"
$OUTDIR=vmdktmp

cd $BUILDDIR/

if (test-path $BOXFILE) {
  # the vbox file is actually in a legacy format for use by vagrant, the file format is gzipped tar file
  mkdir $OUTDIR
  7z e virtualbox-centos7.box
  7z x virtualbox-centos7.tar -o"$OUTDIR"
  remove-item virtualbox-centos7.tar
  cd $OUTDIR

  # Now we have unpacked the VMDK file we can use virtualbox to convert to hyper-v compatible VHD format
  # (annoying move of file into tmp dir for compression (since MS compression API only compresses directories)
  VBoxManage clonehd packer-centos-7-x86_64-disk001.vmdk $VHDFILE --format vhd
  7z a $HVFILE $VHDFILE

  # move the converted file up to the $BUILDDIR dir and clean up the temp files
  mv $VHDFILE ..
  cd ..
  Remove-Item -Recurse -Force $OUTDIR
}
