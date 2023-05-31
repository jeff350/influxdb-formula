# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}


{% if influxdb.pkg.dependencies is defined %}
influxdb/dependencies/install:
  pkg.installed:
    - pkgs:
    {% for package in influxdb.pkg.dependencies %}
      - {{ package }}
    {% endfor %}
{% endif %}

