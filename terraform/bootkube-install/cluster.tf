// Kubernetes cluster
module "cluster" {
  source = "git::https://github.com/poseidon/typhoon//bare-metal/container-linux/kubernetes?ref=v1.9.3"

  providers = {
    local = "local.default"
    null = "null.default"
    template = "template.default"
    tls = "tls.default"
  }

  # install
  matchbox_http_endpoint  = "${var.matchbox_http_endpoint}"
  container_linux_channel = "${var.container_linux_channel}"
  container_linux_version = "${var.container_linux_version}"
  ssh_authorized_key      = "${var.ssh_authorized_key}"

  # cluster
  cluster_name    = "${var.cluster_name}"
  k8s_domain_name = "${var.k8s_domain_name}"

  # machines
  controller_names   = "${var.controller_names}"
  controller_macs    = "${var.controller_macs}"
  controller_domains = "${var.controller_domains}"
  worker_names       = "${var.worker_names}"
  worker_macs        = "${var.worker_macs}"
  worker_domains     = "${var.worker_domains}"

  # bootkube assets
  asset_dir = "${var.asset_dir}"

  # Optional
  networking                    = "${var.networking}"
  cached_install                = "${var.cached_install}"
  install_disk                  = "${var.install_disk}"
  container_linux_oem           = "${var.container_linux_oem}"
}
