# Vagrant Tile Server

A Vagrant based tile server development envirionment.

![](https://www.evernote.com/l/ABWj6z8iV9BN77QoJohC7met9Ra_C-Q-afcB/image.png)

* Ubuntu 16.04 LTS
* Mapnik
* PostgreSQL
  * PostGIS
* Apache
  * tile_module
* osm2pgsql
* carto
* openstreetmap-carto

This vagrant environment is based on following article.

https://www.linuxbabe.com/linux-server/openstreetmap-tile-server-ubuntu-16-04

### Requires

* Vagrant
* VirtualBox
* 2GB+ Memory

## Getting Started

```
$ git clone git@github.com:miya0001/vagrant-tile-server.git
$ cd vagrant-tile-server
$ vagrant up
```

Please wait 15 minutes or so. :smile:

Then visit:

http://192.168.33.10/map/0/0/0.png

Default values are in the `provision/defaults.yml`, you can overwrite them with `config.json`.

###  Database

* User: vagrant
* Database Name: gis

## Automated Testing

Run following after `vagrant up`.

```
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```

## Other notes

* Default data in the `provision/default.osm` is only my hometown. :smile:
* `openstreetmap-carto` is at the `/usr/local/src/openstreetmap-carto-2.41.0`.

## License

MIT
