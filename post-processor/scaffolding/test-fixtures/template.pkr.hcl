source "null" "basic-example" {
  communicator = "none"
}

build {
  sources = [
    "source.null.basic-example"
  ]

  post-processor "livecd-my-post-processor" {
    mock = "my-mock-config"
  }
}
