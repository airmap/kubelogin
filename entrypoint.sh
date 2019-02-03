#!/bin/sh

echo $KUBECONFIG
echo $CLIENT_SECRET
echo $CLIENT_ID

CLUSTER=$(kubectl config current-context)
kubectl config set-context $CLUSTER --cluster=$CLUSTER --user=oidc-user
kubectl config set-credentials oidc-user  \
          --auth-provider=oidc  \
          --auth-provider-arg=idp-issuer-url=https://openid-connect.onelogin.com/oidc \
          --auth-provider-arg=client-id=$CLIENT_ID \
          --auth-provider-arg=client-secret=$CLIENT_SECRET \
          --auth-provider-arg=extra-scopes=groups
kubelogin
