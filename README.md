# docker-dyn-nginx

[![](https://images.microbadger.com/badges/version/joshuamarquez/dyn-nginx:0.1.0.svg)](https://microbadger.com/images/joshuamarquez/dyn-nginx:0.1.0 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/joshuamarquez/dyn-nginx:0.1.0.svg)](https://microbadger.com/images/joshuamarquez/dyn-nginx:0.1.0 "Get your own image badge on microbadger.com")

Collection of [NGINX](https://hub.docker.com/r/library/nginx/) templates for env var substitution.

## Install

```sh
$ docker pull joshuamarquez/dyn-nginx
```

## Templates

**Node.js with Socket.IO**

Template name: `NODE_JS_SOCKET_IO`

This template ha special [configuration](https://www.nginx.com/blog/nginx-nodejs-websockets-socketio) for Node.js Apps with support for Socket.IO.

Environment variables

* `NODE_JS_SOCKET_IO_PORT` - Port to listen inside container, e.g. `3000`.
* `NODE_JS_SOCKET_IO_TARGET`: Target name, e.g. `example.com:8080`.

## Usage

You need to specify template names separated by commas in `TEMPLATES` environment variable.

### Example

In the example below we will use template `NODE_JS_SOCKET_IO`.

First set env vars in `.env` file.

```
TEMPLATES=NODE_JS_SOCKET_IO
NODE_JS_SOCKET_IO_PORT=3000
NODE_JS_SOCKET_IO_TARGET=example.com:8080
```

Then run `dyn-nginx`.

```bash
$ docker run --rm --env-file .env joshuamarquez/dyn-nginx
```
