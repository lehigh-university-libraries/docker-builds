# Docker builds

Various docker containers used within Lehigh Libraries infrastructure.

## Structure

```
|-- ./image1
|   `-- ./image1/Dockerfile
|   `-- ./image1/.build-args/TAG1
|   `-- ./image1/.build-args/TAG2
|-- ./image2
|   `-- ./image2/Dockerfile
|   `-- ./image2/.build-args/TAG1
...
...
...
|-- ./imageN
|   `-- ./imageN/Dockerfile
|   `-- ./imageN/.build-args/TAG1

```

Each docker image is defined within its own directory.

The image then has a `.build-args` directory. That directory contains a file that is represents a specific version for the tag. The file then contains any `build-args` that may be needed for the docker build.
