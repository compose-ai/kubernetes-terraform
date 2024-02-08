apiVersion: v1
clusters:
- cluster:
    server: ${cluster_endpoint}
    certificate-authority-data: ${cluster_ca}
  name: ${cluster_name}
contexts:
- context:
    cluster: ${cluster_name}
    user: ${username}
  name: ${cluster_name}
current-context: ${cluster_name}
kind: Config
preferences: {}
users:
- name: ${username}
  user:
    client-certificate-data: ${client_cert}
    client-key-data: ${client_key}
    token: ${password}
