variable "PHP" {
  default = "8.2"
  type    = string
}

variable "WP" {
  default = "6.2.7"
  type    = string
}

variable "SHA" {
  default = "8ed5bead7b4ad55c8fedacae58d8c53a56f4f290"
  type    = string
}

group "all" {
  targets = [ "apache", "fpm", "fpm-alpine" ]
}

target "apache" {
    args = {
      PHP_VERSION = PHP
      WP_VERSION  = WP
      WP_SHA      = SHA
    }
    dockerfile = "apache.Dockerfile"
    context    = "."
    platforms  = [ "linux/amd64" ]
    tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-apache" ]
}

target "fpm" {
    args = {
      PHP_VERSION = PHP
      WP_VERSION  = WP
      WP_SHA      = SHA
    }
    dockerfile = "fpm.Dockerfile"
    context    = "."
    platforms  = [ "linux/amd64" ]
    tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-fpm" ]
}

target "fpm-apline" {
    args = {
      PHP_VERSION = PHP
      WP_VERSION  = WP
      WP_SHA      = SHA
    }
    dockerfile = "fpm-alpine.Dockerfile"
    context    = "."
    platforms  = [ "linux/amd64" ]
    tags       = [ "ghcr.io/irc-mmaltese/wordpress:${WP}-php${PHP}-fpm-alpine" ]
}