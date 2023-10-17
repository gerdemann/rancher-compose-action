# A rancher-compose up -d action

This action executes `rancher-compose up -d`.

## Inputs

## `RANCHER_URL`

**Required** The URL of the rancher server. Default `"http://rancher.example:8080"`.

## `RANCHER_ACCESS_KEY`

**Required** The ACCESS_KEY of rancher. Default `""`.

## `RANCHER_SECRET_KEY`

**Required** The SECRET_KEY of rancher. Default `""`.

## `RANCHER_COMPOSE_FILE`

**Required** The rancher-compose.yml file. Default `"rancher-compose.yml"`.

## `DOCKER_COMPOSE_FILE`

**Required** The docker-compose.yml file. Default `"docker-compose.yml"`.

## `STACK_NAME`

**Required** The name of the stack. Default `"default"`.

## `ENV_FILE`

**Required** The .env file. Default `""`.

## `PULL_IMAGES`

Pull Docker images before upgrading. Default `"false"`.

## Example usage

```
uses: gerdemann/rancher-compose-action@v1
with:
  RANCHER_URL: 'http://rancher.example.com:8080'
  RANCHER_ACCESS_KEY: '1234567'
  RANCHER_SECRET_KEY: 'abcdef123456'
  RANCHER_COMPOSE_FILE: 'rancher-compose.yml'
  DOCKER_COMPOSE_FILE: 'docker-compose.yml'
  STACK_NAME: 'example'
  ENV_FILE: '.env'
  PULL_IMAGES: 'true'

```
