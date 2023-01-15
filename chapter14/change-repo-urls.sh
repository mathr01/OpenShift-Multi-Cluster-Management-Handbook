#!/bin/bash

echo "================================================"
echo ""
echo "Change the references to your forked Git repo"
echo "Created by: Giovanni Fontana"
echo ""
echo "================================================"

echo "** Input your github username: "
read repo_user
echo ""
echo "** Changing ArgoCD and Pipeline manifests to your forked repo (https://github.com/$repo_user/Openshift-Multi-Cluster-management/)"

sed -i "s/PacktPublishing/$repo_user/" ./Build/Pipeline/quarkus-build-pi.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Build/PipelineRun/quarkus-build-pr.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Deploy/argo-app.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Deploy/Pipeline/quarkus-build-and-deploy-pi.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Deploy/PipelineRun/quarkus-build-and-deploy-pr.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/argo-app-v1.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/argo-app-v2.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/Pipeline/quarkus-devsecops-v1-pi.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/Pipeline/quarkus-devsecops-v2-pi.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/PipelineRun/quarkus-devsecops-v1-pr.yaml
sed -i "s/PacktPublishing/$repo_user/" ./DevSecOps/PipelineRun/quarkus-devsecops-v2-pr.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Multicluster-Deployment/applicationset.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Multicluster-Deployment/Pipeline/quarkus-multicluster-pi.yaml
sed -i "s/PacktPublishing/$repo_user/" ./Multicluster-Deployment/PipelineRun/quarkus-multicluster-pr.yaml

echo "** Input the full path to the image in your image registry (e.g.: quay-registry-quay-openshift-operators.apps.ocpcluster.example.com/demo/quarkus-quickstarts): "
read registry_path
echo ""
echo "** Changing Image Registry path:"

sed -i "s~image-path-changeme~$registry_path~" ./Build/PipelineRun/quarkus-build-pr.yaml
sed -i "s~image-path-changeme~$registry_path~" ./Deploy/PipelineRun/quarkus-build-and-deploy-pr.yaml
sed -i "s~image-path-changeme~$registry_path~" ./DevSecOps/PipelineRun/quarkus-devsecops-v1-pr.yaml
sed -i "s~image-path-changeme~$registry_path~" ./DevSecOps/PipelineRun/quarkus-devsecops-v2-pr.yaml
sed -i "s~image-path-changeme~$registry_path~" ./Multicluster-Deployment/PipelineRun/quarkus-multicluster-pr.yaml
sed -i "s~image-path-changeme~$registry_path~" ../quarkus-getting-started/k8s/overlay/v1/kustomization.yaml
sed -i "s~image-path-changeme~$registry_path~" ../quarkus-getting-started/k8s/overlay/v2/kustomization.yaml

echo ""
echo "** Manifest files changed. Pushing changes to GitHub (please inform your GitHub user and password if asked)."

cd ..
git add * >>/dev/null
git commit -m 'Changed to forked repo' >>/dev/null
git push -u origin main >>/dev/null

echo ""
echo "** References changed to your forked repository"