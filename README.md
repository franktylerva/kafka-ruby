# kafka-ruby

Create a Certificate Authority
```
openssl genrsa -des3 -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out cA.pem
```

Create a secret to store the CA.
```
kubectl create secret generic ca-secret --from-file=certs/ca.pem
```

Deploy cert-manager to your Kubernetes cluster.
```
helm install cert-manager oci://registry-1.docker.io/bitnamicharts/cert-manager -f cert-manager/values.yaml
```

Create the certificate issuer.
```
kubectl apply -f cert-manager/issuer.yaml
```

Create the certificates.
```
kubectl apply -f kafka/certificate.yaml
```

Deploy Kafka to your Kubernetes cluster.
```
helm install kafka oci://registry-1.docker.io/bitnamicharts/kafka -f kafka/tls.yaml
```

```
kubectl apply -f kafka/ruby-pod.yaml
```