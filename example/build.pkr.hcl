packer {
  required_plugins {
    livecd = {
      version = ">=v0.1.0"
      source  = "github.com/hashicorp/livecd"
    }
  }
}

source "livecd-my-builder" "foo-example" {
  mock = local.foo
}

source "livecd-my-builder" "bar-example" {
  mock = local.bar
}

build {
  sources = [
    "source.livecd-my-builder.foo-example",
  ]

  source "source.livecd-my-builder.bar-example" {
    name = "bar"
  }

  provisioner "livecd-my-provisioner" {
    only = ["livecd-my-builder.foo-example"]
    mock = "foo: ${local.foo}"
  }

  provisioner "livecd-my-provisioner" {
    only = ["livecd-my-builder.bar"]
    mock = "bar: ${local.bar}"
  }

  post-processor "livecd-my-post-processor" {
    mock = "post-processor mock-config"
  }
}
