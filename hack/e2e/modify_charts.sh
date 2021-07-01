#!/usr/bin/env bash
{
  echo '            - "-test.coverprofile=/workspace/data/e2e-profile.out"'
  echo '            - "__DEVEL__E2E"'
  echo '            - "-test.run=E2EMain"'
  echo '            - "-test.coverpkg=$(go list ./pkg/...| tr '"'"'\n'"'"' '"'"','"'"'| sed '"'"'s/,$//g'"'"')"'
} > tmp_add.txt
sed '/          args:/r tmp_add.txt' ./charts/vela-core/templates/kubevela-controller.yaml > tmp.yaml
rm ./charts/vela-core/templates/kubevela-controller.yaml
cat tmp.yaml
mv tmp.yaml ./charts/vela-core/templates/kubevela-controller.yaml

sed '/          args:/r tmp_add.txt' ./charts/oam-runtime/templates/oam-runtime-controller.yaml > tmp.yaml
rm ./charts/oam-runtime/templates/oam-runtime-controller.yaml
rm tmp_add.txt
cat tmp.yaml
mv tmp.yaml ./charts/oam-runtime/templates/oam-runtime-controller.yaml