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

Default values are in the `provision/defaults.yml`, you can overwrite them with `config.json`.

###  PostgreSQL Database Account

* User: vagrant
* Database Name: gis

## Customizing

If you want to develop your own carto project, you can do it as follows.

1. Place your own carto project (e.g,`my-carto`) into the same directory with `Vagrantfile`.
2. Place `config.json` in the same place as above.
3. Run `vagrant provision`.

Example of the `config.json` is like following.

```
renderd:
  xml: /vagrant/my-carto/style.xml

kosmtik:
  project: /vagrant/my-carto/project.mml
  center:
    lat: 33.47695002414991
    lng: 135.77839851379397
    zoom: 14
```

### How to Import Your Data

If you want to import your data of the OpenStreetMap, edit `config.json` like following.

```
osm2pgsql:
  data: /vagrant/provision/default.osm
  style: /vagrant/openstreetmap-carto-3.1.0/openstreetmap-carto.style
```

For more details, please see `provision/defaults.json`.

## Automated Testing

Run following after `vagrant up`.

```
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```

## Other Notes

* Default data in the `provision/default.osm` contains only my hometown in Japan. :smile:

## License

MIT
