# Docker builds

Various docker containers used within Lehigh Libraries infrastructure.

## Structure

```
|-- ./.github/workflows/image1.yml
|-- ./.github/workflows/image2.yml
...
...
...
|-- ./.github/workflows/imageN.yml
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

The image then has a GitHub action defined in [.github/workflows](./.github/workflows) that uses the base [build-push GitHub Action workflow](./.github/workflows/build-push.yml) to push images to Google Artifact Registry.
