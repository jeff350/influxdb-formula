# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}

{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}
{%- from tplroot ~ "/macros.jinja" import format_kwargs with context %}

influxdb-repo-clean-remove-repo:
  pkgrepo.absent:
    {{- format_kwargs(influxdb.repo) }}
