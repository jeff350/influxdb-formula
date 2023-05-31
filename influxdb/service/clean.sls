# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}
influxdb-service-clean-service-dead:
  service.dead:
    - name: {{ influxdb.service.name }}
    - enable: False
