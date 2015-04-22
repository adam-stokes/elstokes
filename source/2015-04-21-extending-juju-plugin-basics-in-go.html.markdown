---
title: Extending Juju: Plugin basics in Go
date: 2015-04-21 22:52 EDT
tags: [ubuntu, juju]
---

This is a quick introduction on extending Juju with plugins. What we'll cover:

* Setting up your Go environment
* Getting the Juju source code
* Writing a basic plugin

# Prerequisites

* Running on Ubuntu 14.04 or above
* Go 1.2.1 or above (Article written using Go 1.2.1)
* A basic understanding of the Go language, package imports, etc.

# Setting up your Go environment

This is all a matter of preference but for the sake of this article we'll do it
my way :)

## Install Go

On Trusty and above:

```
sudo apt-get install golang
```

## Go dependency management

2 projects I use are:

* https://github.com/pote/gpm - Barebones dependency manager for Go
* https://github.com/pote/gvp - Go Versioning Packager

### Install

```
$ cd /tmp && git clone https://github.com/pote/gvp.git && cd gvp && sudo ./configure && sudo make install
$ cd /tmp && git clone https://github.com/pote/gpm.git && cd gpm && sudo ./configure && sudo make install
```

Feel free to check out their project pages for additional uses.

## Create your project directory

```
$ mkdir ~/Projects/juju-learnyouaplugin
$ cd ~/Projects/juju-learnyouaplugin
```

## Setup the project specific Go paths

```
$ source gvp in
```

This will setup your **$GOPATH** and **$GOBIN** variables for use when resolving imports, compiling, etc.

```
$ echo $GOPATH
/home/adam/Projects/juju-learnyouaplugin/.godeps
$ echo $GOBIN
/home/adam/Projects/juju-learnyouaplugin/.godeps/bin
```

From this point on all package dependencies will be stored in the project's **.godeps** directory.

# Get the Juju code

From your project's directory run:

```
$ go get -d -v github.com/juju/juju/...
```

# Writing the plugin

Now that all the preparatory tasks are complete we can begin the fun
stuff. Using your favorite editor open up a new file **main.go**. Within this file we need to define a few
package imports that are necessary for the plugin.

```go
import (
	"fmt"
	"github.com/juju/juju/cmd/envcmd"
	"github.com/juju/juju/juju"
	"github.com/juju/juju/juju/osenv"
	"github.com/juju/juju/state"

	_ "github.com/juju/juju/provider/all"
)
```
