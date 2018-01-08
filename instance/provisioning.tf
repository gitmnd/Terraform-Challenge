data "template_file" "cloud_init" {
  template = "${file("${path.module}/provisioning/templates/cloud-config.tpl")}"

resource "template_cloudinit_config" "ms_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloud_init.rendered}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
