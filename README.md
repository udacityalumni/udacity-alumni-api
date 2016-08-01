# Alumni Web App API

## Getting Started
Welcome!!  This app is the starter project for the Udacity Alumni Web Application project.  More information will be provided here and in [the Udacity Alumni Wiki](https://github.com/udacityalumni/resources/wiki) as it becomes available.

The docker container will do _all_ of the networking between the database and app and will start a rails server.

To open the correct URL in your web browser, you can run the following

```
open "http://$(docker-machine ip default):3000"
```

Which will print out the IP of the docker-machine and open a web browser to the correct URL where the server is serving from.

### Installing
The installation is completely automated by Docker.  Please reference the [Docker installation guide](https://docs.docker.com/engine/installation/) if you need any help getting setup.

Running
```
docker-compose up
```
will do all of the heavy lifting for you in getting your app setup.

Once installed, to access the docker container internally, please run
```
docker exec -it alumniapi_app_1 bash
```

In this example, the app container is named alumniapi_app_1.  Please substitute the name of the container if the command fails due to the container name being changed. You can locate the container's name from listing all docker containers with:  `docker ps -a`.

## Deployment
TBD

## Built With
Rails v5 Api Mode

## Authors

* **Ryan Collins**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
TBD
