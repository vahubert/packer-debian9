# Debian 9 minimal Vagrant Box

**Current CentOS Version Used**: 9.4

**Pre-built Vagrant Box**:

  - [`vagrant init vhubert/debian9`](https://app.vagrantup.com/vhubert/boxes/centos6)

## Requirements

You must use Windows OS.
The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)
  - [VMware Workstation Pro](https://www.vmware.com/products/workstation-pro.html) (if you want to build the VMware Workstation box)
  - [vagrant-vmware-desktop](https://www.vagrantup.com/vmware/index.html) (if you want to build the VMware Workstation box)
  - [Hyper-V](https://www.virtualbox.org/) (if you want to build the Hyper-V box)

## Usage

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ .\run provider_name

After a few minutes, Packer should tell you the box was generated successfully, and the box was uploaded to Vagrant Cloud.

> **Note**: This configuration includes a post-processor that pushes the built box to Vagrant Cloud (which requires a `VAGRANT_CLOUD_TOKEN` environment variable to be set); remove the `vagrant-cloud` post-processor from the Packer template to build the box locally and not push it to Vagrant Cloud. You don't need to specify a `version` variable either, if not using the `vagrant-cloud` post-processor.


## License

MIT license.
