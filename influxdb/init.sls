# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}

include:
{% if influxdb.pkg.dependencies is defined %}
  - .dependencies
{% endif %}
  - .repo
  - .package
  - .config
  - .service
