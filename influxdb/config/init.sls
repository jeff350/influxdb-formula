# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}

include:
  - .file
{% if influxdb.ssl is defined %}
  - .ssl
{% endif %}

