variable "PHP_VER" {
  default = "8.2"
  type    = string
}

variable "WP_VER" {
  default = "6.2.7"
  type    = string
}

variable "WP_HASH" {
  default = "8ed5bead7b4ad55c8fedacae58d8c53a56f4f290"
  type    = string
}

target "build" {
  name = "build-${app}"
  args = {
    PHP_VERSION = PHP_VER
    WP_VERSION  = WP_VER
    WP_SHA      = WP_HASH
  }
  matrix = {
    app = [ "fpm-alpine" ]
  }
  dockerfile = "${app}.Dockerfile"
  platforms  = [ "linux/amd64" ]
  tags       = ["ghcr.io/irc-mmaltese/wordpress:${WP_VER}-php${PHP_VER}-${app}"]
}

// group "all" {
//   targets = [ "apache", "fpm", "fpm-alpine" ]
// }

// target "apache" {
//     args = {
//       PHP_VERSION = PHP
//       WP_VERSION  = WP
//       WP_SHA      = SHA
//     }
//     dockerfile = "apache.Dockerfile"
//     context    = "."
//     platforms  = [ "linux/amd64" ]
//     tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-apache" ]
// }

// target "fpm" {
//     args = {
//       PHP_VERSION = PHP
//       WP_VERSION  = WP
//       WP_SHA      = SHA
//     }
//     dockerfile = "fpm.Dockerfile"
//     context    = "."
//     platforms  = [ "linux/amd64" ]
//     tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-fpm" ]
// }

// target "fpm-alpine" {
//     args = {
//       PHP_VERSION = PHP
//       WP_VERSION  = WP
//       WP_SHA      = SHA
//     }
//     dockerfile = "fpm-alpine.Dockerfile"
//     context    = "."
//     platforms  = [ "linux/amd64" ]
//     tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-fpm-alpine" ]
// }