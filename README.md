# Docker builds

Various docker containers used within Lehigh Library Technology's infrastructure.

## Structure

```
|-- ./image1
|   `-- ./image1/Dockerfile
|-- ./image2
|   `-- ./image2/Dockerfile
...
...
...
|-- ./imageN
|   `-- ./imageN/Dockerfile

```

Each docker image is defined within its own directory.

Dependencies are managed in GitHub Actions to only build when a file in the given directory has changed.

