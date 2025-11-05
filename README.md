# meta-bolt-youtube

Bitbake meta layer extending the **bolt** distro with recipes allowing to build WPE WebKit OCI image.

# Setup and building

See [Setup and building](https://github.com/rdkcentral/meta-bolt-distro/blob/develop/README.md#setup-and-building)
section in the [meta-bolt-distro](https://github.com/rdkcentral/meta-bolt-distro) documentation.

## WPE OCI image building instructions

* Download this repository and enter its root directory.
```
git clone https://github.com/rdkcentral/meta-bolt-wpe.git
cd meta-bolt-wpe
```

* Setup the build environment.
```
source setup-environment
```

* Start building the WPE WebKit OCI image.
```
bitbake wpe-bolt-image
```
