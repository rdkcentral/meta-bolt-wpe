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

## Building the WebKit as bolt package

To create Bolt packages for WebKit, ensure that the base package is available in the package store. Refer to the [building the base bolt package](https://github.com/rdkcentral/meta-bolt-distro?tab=readme-ov-file#building-the-base-bolt-package) section to generate the base package and setting up the package store.


Follow the same steps mentioned in the [WPE OCI image building instructions](#WPE-OCI-image-building-instructions) chapter to setup and build the WebKit application, but instead of calling `bitbake <target>`, use the [bolt tool](https://github.com/rdkcentral/bolt-tools/tree/main/bolt) to create bolt packages for WebKit.

```
bolt make wpe-runtime --install
bolt make wpe-application

```

## Running WebKit bolt packages on device

To run bolt packages on device, use `bolt push` and `bolt run` as explained in [bolt tool usage](https://github.com/rdkcentral/bolt-tools/tree/main/bolt#usage)

```
bolt push <remote> com.rdkcentral.base+0.1.0                # here <remote> is the Hostname or alias of a device accessible via SSH in non-interactive mode

bolt push <remote> com.rdkcentral.wpe+0.0.1

bolt push <remote> com.rdkcentral.ytlr-cert-2021+0.0.1

bolt run <remote> com.rdkcentral.ytlr-cert-2021+0.0.1

```
