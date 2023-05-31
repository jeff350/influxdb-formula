# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}

include:
  - {{ sls_config_file }}

influxdb/config/ssl/cert:
  file.managed:
    - name: {{ influxdb.conf["tls-cert"] }}
    - mode: 644
    - user: {{ influxdb.system_user }}
    - group: {{ influxdb.system_group }}
    - makedirs: True
    - contents_pillar: influxdb:ssl:cert
    - require:
      - sls: {{ sls_config_file }}

influxdb/config/ssl/key:
  file.managed:
    - name: {{ influxdb.conf["tls-key"] }}
    - mode: 600
    - user: {{ influxdb.system_user }}
    - group: {{ influxdb.system_group }}
    - makedirs: True
    - contents_pillar: influxdb:ssl:key
    - require:
      - sls: {{ sls_config_file }}
