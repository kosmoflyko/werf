module github.com/werf/werf

go 1.14

require (
	bou.ke/monkey v1.0.1
	github.com/Masterminds/goutils v1.1.0
	github.com/Masterminds/semver v1.5.0
	github.com/Masterminds/sprig/v3 v3.2.0
	github.com/agl/ed25519 v0.0.0-20170116200512-5312a6153412 // indirect
	github.com/alessio/shellescape v0.0.0-20190409004728-b115ca0f9053
	github.com/aws/aws-sdk-go v1.31.6
	github.com/bitly/go-hostpool v0.1.0 // indirect
	github.com/bmatcuk/doublestar v1.1.5
	github.com/bugsnag/bugsnag-go v1.5.3 // indirect
	github.com/bugsnag/panicwrap v1.2.0 // indirect
	github.com/cloudflare/cfssl v1.4.1 // indirect
	github.com/docker/cli v0.0.0-20200803101120-f4f962292d47
	github.com/docker/docker v17.12.0-ce-rc1.0.20200728121027-0f41a77c6993+incompatible
	github.com/docker/go v1.5.1-1 // indirect
	github.com/docker/go-connections v0.4.0
	github.com/docker/go-metrics v0.0.1 // indirect
	github.com/docker/go-units v0.4.0
	github.com/emicklei/go-restful v2.13.0+incompatible // indirect
	github.com/fatih/color v1.9.0
	github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32
	github.com/go-git/go-billy/v5 v5.0.0
	github.com/go-git/go-git/v5 v5.1.1-0.20200721083337-cded5b685b8a
	github.com/go-openapi/spec v0.19.3
	github.com/go-openapi/strfmt v0.19.3
	github.com/go-openapi/validate v0.19.5
	github.com/gofrs/uuid v3.3.0+incompatible // indirect
	github.com/gogo/googleapis v1.4.0 // indirect
	github.com/google/go-containerregistry v0.2.0
	github.com/google/uuid v1.1.2
	github.com/gosuri/uitable v0.0.4
	github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed // indirect
	github.com/hashicorp/go-multierror v1.0.0
	github.com/hashicorp/go-version v1.2.0
	github.com/huandu/xstrings v1.3.2 // indirect
	github.com/jinzhu/gorm v1.9.12 // indirect
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
	github.com/mailru/easyjson v0.7.2 // indirect
	github.com/miekg/pkcs11 v1.0.3 // indirect
	github.com/moby/buildkit v0.7.1-0.20200615045306-df35e9818d1f
	github.com/moby/term v0.0.0-20200611042045-63b9a826fb74 // indirect
	github.com/mvdan/xurls v1.1.0 // indirect
	github.com/oleiade/reflections v1.0.0 // indirect
	github.com/onsi/ginkgo v1.12.0
	github.com/onsi/gomega v1.9.0
	github.com/opencontainers/runc v1.0.0-rc8.0.20190926000215-3e425f80a8c9 // indirect
	github.com/otiai10/copy v1.0.1
	github.com/otiai10/curr v1.0.0 // indirect
	github.com/pkg/errors v0.9.1
	github.com/prashantv/gostub v1.0.0
	github.com/rodaine/table v1.0.0
	github.com/satori/go.uuid v1.2.0
	github.com/sirupsen/logrus v1.7.0
	github.com/spaolacci/murmur3 v1.1.0
	github.com/spf13/cobra v1.1.1
	github.com/spf13/pflag v1.0.5
	github.com/theupdateframework/notary v0.6.1 // indirect
	github.com/tonistiigi/fsutil v0.0.0-20200724193237-c3ed55f3b481 // indirect
	github.com/tonistiigi/go-rosetta v0.0.0-20200727161949-f79598599c5d // indirect
	github.com/werf/kubedog v0.4.1-0.20201210200031-65b86902f889
	github.com/werf/lockgate v0.0.0-20200729113342-ec2c142f71ea
	github.com/werf/logboek v0.4.6
	github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb // indirect
	golang.org/x/crypto v0.0.0-20201002170205-7f63de1d35b0
	golang.org/x/net v0.0.0-20201110031124-69a78807bb2b
	gopkg.in/dancannon/gorethink.v3 v3.0.5 // indirect
	gopkg.in/fatih/pool.v2 v2.0.0 // indirect
	gopkg.in/gorethink/gorethink.v3 v3.0.5 // indirect
	gopkg.in/ini.v1 v1.56.0
	gopkg.in/oleiade/reflections.v1 v1.0.0
	gopkg.in/yaml.v2 v2.3.0
	helm.sh/helm/v3 v3.2.4
	k8s.io/api v0.20.1
	k8s.io/apimachinery v0.20.1
	k8s.io/cli-runtime v0.20.1
	k8s.io/client-go v0.20.1
	k8s.io/klog v1.0.0
	k8s.io/klog/v2 v2.4.0
	k8s.io/kubectl v0.20.1
	mvdan.cc/xurls v1.1.0
	rsc.io/letsencrypt v0.0.3 // indirect
	sigs.k8s.io/yaml v1.2.0
	vbom.ml/util v0.0.0-20180919145318-efcd4e0f9787 // indirect
)

replace k8s.io/api => k8s.io/api v0.19.2

replace k8s.io/apimachinery => k8s.io/apimachinery v0.19.2

replace k8s.io/cli-runtime => k8s.io/cli-runtime v0.19.2

replace k8s.io/client-go => k8s.io/client-go v0.19.2

replace k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.19.2

replace k8s.io/code-generator => k8s.io/code-generator v0.16.8-beta.0

replace k8s.io/component-base => k8s.io/component-base v0.19.2

replace k8s.io/kubectl => k8s.io/kubectl v0.19.2

replace github.com/docker/docker => github.com/docker/docker v17.12.0-ce-rc1.0.20200728121027-0f41a77c6993+incompatible

replace github.com/containerd/containerd => github.com/containerd/containerd v1.3.1-0.20200508210449-c80284d4b529

replace github.com/jaguilar/vt100 => github.com/tonistiigi/vt100 v0.0.0-20190402012908-ad4c4a574305

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v13.3.2+incompatible

replace helm.sh/helm/v3 => github.com/werf/helm/v3 v3.0.0-20210126133715-47cadc07216a

replace github.com/deislabs/oras => github.com/werf/oras v0.8.2-0.20210128161614-26d583f169ea
