# Vagrant Tile Server

A Vagrant based tile server development envirionment.

![](https://www.evernote.com/l/ABWj6z8iV9BN77QoJohC7met9Ra_C-Q-afcB/image.png)

* Mapnik
* PostgreSQL
  * PostGIS
* Apache
  * tile_module
* osm2pgsql
* node-carto
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

Please wait 15 minutes or so. :)

Then visit:

http://192.168.33.10/map/0/0/0.png

## Automated Testing

Run following after `vagrant up`.

```
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```

## Note

* Default data in the `provision/default.osm` is only my hometown. :)
* `openstreetmap-carto` is in the `/usr/local/src/openstreetmap-carto-2.41.0`.
* I guess you have to add fonts to display multibyte charactors in `provision/config.yml`.

## License

MIT
