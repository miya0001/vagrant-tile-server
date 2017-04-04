# Vagrant Tile Server

A Vagrant based tile server development envirionment.

![](https://www.evernote.com/l/ABWtQwn_tP1Fv5c7ZHEgYLrFgcvySIFdR4IB/image.png)

## What's Installed

* Ubuntu 16.04 LTS
* Mapnik 3.0.x
* PostgreSQL 9.5.x
  * PostGIS 2.2
* Apache 2.4.x
  * tile_module
* osm2pgsql 0.88.x
* node 6.x
  * carto 0.17.x
  * kosmtik 0.0.15
  * TileMill
  * pm2 2.4.x
  * cartocc
* openstreetmap-carto 3.1.0

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

Please wait 20 minutes or so. :smile:

* Tile Server: http://192.168.33.10/map/0/0/0.png
* Kosmtik: http://192.168.33.10:6789/

Default values are in the `provision/defaults.yml`, you can overwrite them with `config.yml`.

###  PostgreSQL Database Account

* User: vagrant
* Database Name: gis

### How to Import Your Data

If you want to import your data of the OpenStreetMap, edit `config.yml` like following.

```
osm2pgsql:
  data: /vagrant/provision/default.osm
```

For more details, please see `provision/defaults.yml`.

## Automated Testing

Run following after `vagrant up`.

```
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```

## Other Notes

* Default data in the `provision/default.osm` contains only my hometown in Japan. :smile:
* If you want to restart kosmtik, execute `pm2 restart kosmtik`.

## License

MIT
