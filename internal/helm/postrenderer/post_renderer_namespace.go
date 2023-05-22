package postrenderer

import (
	"bytes"

	"sigs.k8s.io/kustomize/api/builtins"
	"sigs.k8s.io/kustomize/api/provider"
	"sigs.k8s.io/kustomize/api/resmap"
	"sigs.k8s.io/kustomize/api/types"

	v2 "github.com/fluxcd/helm-controller/api/v2beta1"
)

func NewPostRendererNamespace(release *v2.HelmRelease) *postRendererNamespace {
	return &postRendererNamespace{
		namespace: release.GetReleaseNamespace(),
	}
}

type postRendererNamespace struct {
	namespace string
}

func (k *postRendererNamespace) Run(renderedManifests *bytes.Buffer) (modifiedManifests *bytes.Buffer, err error) {
	resFactory := provider.NewDefaultDepProvider().GetResourceFactory()
	resMapFactory := resmap.NewFactory(resFactory)

	resMap, err := resMapFactory.NewResMapFromBytes(renderedManifests.Bytes())
	if err != nil {
		return nil, err
	}

	namespaceTransformer := builtins.NamespaceTransformerPlugin{
		ObjectMeta: types.ObjectMeta{
			Namespace: k.namespace,
		},
	}

	if err := namespaceTransformer.Transform(resMap); err != nil {
		return nil, err
	}

	yaml, err := resMap.AsYaml()
	if err != nil {
		return nil, err
	}

	return bytes.NewBuffer(yaml), nil
}
