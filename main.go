package main

import (
	"fmt"
	"os"
	"packer-plugin-livecd/builder/livecd"
	livecdData "packer-plugin-livecd/datasource/livecd"
	livecdPP "packer-plugin-livecd/post-processor/livecd"
	livecdProv "packer-plugin-livecd/provisioner/livecd"
	livecdVersion "packer-plugin-livecd/version"

	"github.com/hashicorp/packer-plugin-sdk/plugin"
)

func main() {
	pps := plugin.NewSet()
	pps.RegisterBuilder("my-builder", new(livecd.Builder))
	pps.RegisterProvisioner("my-provisioner", new(livecdProv.Provisioner))
	pps.RegisterPostProcessor("my-post-processor", new(livecdPP.PostProcessor))
	pps.RegisterDatasource("my-datasource", new(livecdData.Datasource))
	pps.SetVersion(livecdVersion.PluginVersion)
	err := pps.Run()
	if err != nil {
		fmt.Fprintln(os.Stderr, err.Error())
		os.Exit(1)
	}
}
