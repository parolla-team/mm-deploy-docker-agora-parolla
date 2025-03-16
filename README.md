# Mattermost Docker
The official Docker deployment solution for Mattermost.

## Install & Usage

Refer to the [Mattermost Docker deployment guide](https://docs.mattermost.com/install/install-docker.html) for instructions on how to install and use this Docker image.

## Contribute
PRs are welcome, refer to our [contributing guide](https://developers.mattermost.com/contribute/getting-started/) for an overview of the Mattermost contribution process.

## Upgrading from `mattermost-docker`

This repository replaces the [deprecated mattermost-docker repository](https://github.com/mattermost/mattermost-docker). For an in-depth guide to upgrading, please refer to [this document](https://github.com/mattermost/docker/blob/main/scripts/UPGRADE.md).



## Re-issue ssl script


```sh
sudo docker compose -f docker-compose.yml -f docker-compose.nginx.yml down
bash scripts/issue-certificate.sh -d agora.parolla.chat -o ${PWD}/certs
sudo docker compose -f docker-compose.yml -f docker-compose.nginx.yml up -d
```
