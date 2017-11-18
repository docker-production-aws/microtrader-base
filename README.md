# Docker in Production using AWS - Microtrader Base Image

This provides the base Docker image for sample applications included with the Pluralsight course [Docker in Production using Amazon Web Services](https://app.pluralsight.com/library/courses/docker-production-using-amazon-web-services/table-of-contents).

## Quick Start

To build this image: 

```
$ docker build -t <org-name>/microtrader-base .
```

## Branches

This repository contains two branches:

- [`master`](https://github.com/docker-production-aws/microtrader-base/tree/master) - represents the initial starting state of the repository as viewed in the course.

- [`final`](https://github.com/docker-production-aws/microtrader-base/tree/final) - represents the final state of the repository after completing all configuration tasks as described in the course material.

> The `final` branch is provided as a convenience in the case you get stuck, or want to avoid manually typing out large configuration files.  In most cases however, you should attempt to configure this repository by following the course material.

To clone this repository and checkout a branch you can simply use the following commands:

```
$ git clone https://github.com/docker-production-aws/packer-ecs.git
...
...
$ git checkout final
Switched to branch 'final'
$ git checkout master
Switched to branch 'master'
```

## Repository Timeline

The following provides links to commits in this repository that represent important milestones in the course material:

- [Architecting and Preparing Applications for ECS](https://github.com/docker-production-aws/microtrader-base/tree/architecting-and-preparing-applications) - this commit represents the state of the repository once you have completed the Architecting and Preparing Applications for ECS module.

- [Managing Secrets in AWS](https://github.com/docker-production-aws/microtrader-base/tree/managing-secrets-in-aws) - this commit represents the state of the repository once you have completed the Managing Secrets in AWS module.

## Errata

No known issues.

## Further Reading

- [confd Quick Start Guide](https://github.com/kelseyhightower/confd/blob/master/docs/quick-start-guide.md)